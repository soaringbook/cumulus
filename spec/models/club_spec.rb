require 'rails_helper'

describe Club do
  context 'Validations' do
    it { should validate_presence_of(:short_name) }
    it { should validate_uniqueness_of(:short_name) }
    it { should validate_length_of(:short_name).is_at_least(3) }

    it 'should have a valid factory' do
      club = create(:club)
      expect(club.valid?).to be_truthy
    end
  end

  context 'Associations' do
    it { should have_many(:pilots).dependent(:destroy) }
    it { should have_many(:gliders).dependent(:destroy) }
  end

  context 'Searching' do
    it 'should find a club by short name' do
      create(:club, short_name: 'short name')
      expect(Club.search('rt n').count).to eq(1)
    end
  end
end
