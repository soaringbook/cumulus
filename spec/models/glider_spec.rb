require 'rails_helper'

describe Glider do
  context 'Validations' do
    it { should validate_presence_of(:immatriculation) }
    it { should validate_uniqueness_of(:immatriculation) }
    it { should validate_presence_of(:name) }

    it 'should have a valid factory' do
      glider = create(:glider)
      expect(glider.valid?).to be_truthy
    end
  end

  context 'Associations' do
    it { should belong_to(:club) }
  end

  context 'Searching' do
    it 'should find a glider by name' do
      create(:glider, name: 'Some name')
      expect(Glider.search('me n').count).to eq(1)
    end

    it 'should find a glider by immatriculation' do
      create(:glider, immatriculation: 'OO-YDB')
      expect(Glider.search('DB').count).to eq(1)
    end
  end
end
