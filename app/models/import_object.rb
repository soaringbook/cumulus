class ImportObject
  include ActiveAttr::Model

  attribute :csv

  validates :csv, presence: true
  validate :validate_file_format

  def validate_file_format
    filename = csv.try(:original_filename)
    return unless filename
    return if filename =~ /\.(csv)\z/i
    errors.add(:csv, I18n.t('pages.import.upload.errors.incorrect_format'))
  end
end
