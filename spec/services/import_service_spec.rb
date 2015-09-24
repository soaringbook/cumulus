require 'rails_helper'

describe ImportService do
  let(:club) { create(:club) }

  context 'Gliders' do
    it 'should not validate invalid file.' do
      service = ImportService.new(Glider, csv: nil)
      expect(service.validate_for(club)).to be_falsy
    end

    it 'should not validate file without records.' do
      service = create_service_with 'gliders_empty', Glider
      expect(service.validate_for(club)).to be_falsy
    end

    it 'should validate file with records.' do
      service = create_service_with 'gliders_all_valid', Glider
      expect(service.validate_for(club)).to be_truthy
    end

    it 'should return records.' do
      service = create_service_with 'gliders_some_valid', Glider
      expect(service.validate_for(club)).to be_truthy
      expect(service.valid_records.count).to eq(2)
      expect(service.invalid_records.count).to eq(1)
    end
  end

  context 'Pilots' do
    it 'should not validate invalid file.' do
      service = ImportService.new(Pilot, csv: nil)
      expect(service.validate_for(club)).to be_falsy
    end

    it 'should not validate file without records.' do
      service = create_service_with 'pilots_empty', Pilot
      expect(service.validate_for(club)).to be_falsy
    end

    it 'should validate file with records.' do
      service = create_service_with 'pilots_all_valid', Pilot
      expect(service.validate_for(club)).to be_truthy
    end

    it 'should return records.' do
      service = create_service_with 'pilots_some_valid', Pilot
      expect(service.validate_for(club)).to be_truthy
      expect(service.valid_records.count).to eq(2)
      expect(service.invalid_records.count).to eq(1)
    end
  end

  private

  def create_service_with(filename, imported_class)
    file = nil
    if filename
      path = File.dirname(__FILE__) + "/../fixtures/#{filename}.csv"
      file = File.new(path, 'r')
    end
    ImportService.new(imported_class, csv: file)
  end
end
