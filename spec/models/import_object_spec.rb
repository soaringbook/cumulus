require 'rails_helper'

describe ImportObject do
  context 'Validations' do
    it { should validate_presence_of(:csv) }

    it 'should not validate an empty file' do
      object = ImportObject.new csv: nil
      expect(object).to be_invalid
    end

    it 'should not validate an png file' do
      object = ImportObject.new csv: mocked_csv('blabla.png')
      expect(object).to be_invalid
    end

    it 'should validate an csv file' do
      object = ImportObject.new csv: mocked_csv('blabla.csv')
      expect(object).to be_valid
    end
  end
end
