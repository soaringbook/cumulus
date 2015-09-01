module Searchable
  extend ActiveSupport::Concern

  included do
    scope :search, ->(query) {
      where_query = self.searchable_fields.map { |f| "LOWER(#{f}) LIKE ?" }
      where_query = where_query.join(' OR ')
      value_query = self.searchable_fields.map { |f| "%#{query.try(:downcase)}%" }
      where(where_query, *value_query)
    }
  end
end
