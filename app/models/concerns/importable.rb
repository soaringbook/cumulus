require 'csv'

module Importable
  extend ActiveSupport::Concern

  included do
    def self.import_file(file, club)
      gliders = []
      CSV.foreach(file.path, headers: true) do |row|
        # Lookup a glider with an existing immatriculation.
        glider = where(immatriculation: row['immatriculation']).first_or_initialize

        # Strip the key and value fields.
        row_hash = row.to_hash.each_with_object({}) do |(key, value), hash|
          hash[key.strip] = value.try :strip
        end

        # Update the attributes.
        glider.attributes = row_hash.slice(*importable_fields)
        glider.club = club
        gliders << glider
      end
      gliders
    end

    def self.import(records, club)
      gliders = []
      failed_gliders = []
      transaction do
        records.values.each do |record|
          glider = where(id: record['id']).first_or_initialize
          glider.attributes = record.slice(*importable_fields)
          glider.club = club

          # Handle required columns.
          glider.double_seater = false if glider.double_seater.nil?
          glider.self_launching = false if glider.self_launching.nil?

          # Error handling.
          begin
            gliders << glider if glider.save
          rescue ActiveRecord::StatementInvalid
            failed_gliders << glider
            raise ActiveRecord::Rollback
          end
        end
      end

      [gliders, failed_gliders]
    end
  end
end
