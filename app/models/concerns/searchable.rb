module Searchable
  extend ActiveSupport::Concern

  included do
    scope :search, lambda { |query|
      where_query = searchable_fields.map { |f| "LOWER(#{f}) LIKE ?" }
      where_query = where_query.join(' OR ')
      value_query = searchable_fields.map { |_f| "%#{query.try(:downcase)}%" }
      where(where_query, *value_query)
    }
  end
end
