class ImportService
  attr_reader :valid_records,
              :invalid_records,
              :object

  def initialize(import_class, params)
    @import_class = import_class
    @params = params
  end

  def validate_for(club)
    @object = ImportObject.new @params
    if @object.valid?
      records = @import_class.import_file(@params[:csv], club)
      if records.count > 0
        @valid_records   = records.select(&:valid?)
        @invalid_records = records.select(&:invalid?)
        return true
      else
        @object.errors.add(:csv, I18n.t('pages.import.upload.errors.no_record'))
        return false
      end
    end
    false
  end

  def records
    [@valid_records, @invalid_records]
  end
end
