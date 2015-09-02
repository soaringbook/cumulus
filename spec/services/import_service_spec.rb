require 'rails_helper'

describe ImportService do
  let(:club) { create(:club) }

  context 'Gliders' do
    it 'should not validate invalid file.' do
      service = ImportService.new(Glider, { csv: nil })
      expect(service.validate_for(club)).to be_falsy
    end

    it 'should not validate file without records.' do
      service = create_service_with 'immatriculation, name'
      expect(service.validate_for(club)).to be_falsy
    end

    it 'should validate file with records.' do
      service = create_service_with 'immatriculation, name\noo-kdb,janus\noo-ydv,asw19'
      expect(service.validate_for(club)).to be_truthy
    end

    it 'should return records.' do
      service = create_service_with 'immatriculation, name\noo-kdb,janus\noo-ydv,asw19\noo-bla,'
      valid_records, invalid_records = service.validate_for(club)
      expect(valid_records.count).to eq(2)
      expect(valid_records.count).to eq(1)
    end
  end

  def create_service_with content
    file = instance_double(ActionDispatch::Http::UploadedFile, original_filename: 'blabla.csv', tempfile: StringIO.new(content))
    ImportService.new(Glider, { csv: file })
  end
end

