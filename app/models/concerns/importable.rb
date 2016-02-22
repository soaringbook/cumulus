require 'csv'

module Importable
  extend ActiveSupport::Concern

  included do
    def self.import_file(file, club)
      records = []
      CSV.foreach(file.path, headers: true) do |row|
        # Lookup a record with an existing immatriculation.
        record = where(club: club, unique_import_key => row[unique_import_key.to_s]).first_or_initialize

        # Strip the key and value fields.
        row_hash = row.to_hash.each_with_object({}) do |(key, value), hash|
          hash[key.strip] = value.try :strip
        end

        # Update the attributes.
        record.attributes = row_hash.slice(*importable_fields)
        record.club = club
        records << record
      end
      records
    end

    def self.import(records, club)
      valid_records = []
      failed_records = []
      transaction do
        records.values.each do |record|
          imported_object = where(club: club, id: record['id']).first_or_initialize
          imported_object.attributes = record.slice(*importable_fields)
          imported_object.club = club

          imported_object.handle_import!

          # Error handling.
          begin
            valid_records << imported_object if imported_object.save
          rescue ActiveRecord::StatementInvalid
            failed_records << imported_object
            raise ActiveRecord::Rollback
          end
        end
      end

      [valid_records, failed_records]
    end
  end
end
