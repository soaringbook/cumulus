require 'rails_helper'

describe ImportObject do
  context 'Validations' do
    it { should validate_presence_of(:csv) }

    it 'should not validate an empty file' do
      object = ImportObject.new csv: nil
      expect(object).to be_invalid
    end

    it 'should not validate an png file' do
      file = instance_double(ActionDispatch::Http::UploadedFile, original_filename: 'blabla.png')
      object = ImportObject.new csv: file
      expect(object).to be_invalid
    end

    it 'should validate an csv file' do
      file = instance_double(ActionDispatch::Http::UploadedFile, original_filename: 'blabla.csv')
      object = ImportObject.new csv: file
      expect(object).to be_valid
    end
  end
end
