class ImportObject
  include ActiveAttr::Model

  attribute :csv

  validates :csv, presence: true
end
