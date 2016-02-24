require 'rails_helper'

describe Club do
  context 'Validations' do
    it { should validate_presence_of(:short_name) }
    it { should validate_uniqueness_of(:short_name) }
    it { should validate_length_of(:short_name).is_at_least(3) }

    it 'should validate an incorrect active until date' do
      club = build(:club, active_until: nil)
      expect(club.valid?).to be_falsy
      expect(club.errors[:active_until].first).to eq('is not a date')
    end

    it 'should validate a correct active until date' do
      club = build(:club, active_until: Date.today)
      expect(club.valid?).to be_truthy
      expect(club.errors.count).to eq(0)
    end

    it 'should have a valid factory' do
      club = create(:club)
      expect(club.valid?).to be_truthy
    end
  end

  context 'Active' do
    it 'should be an active club until today' do
      club = create(:club, active_until: Date.today)
      expect(club.active?).to be_truthy
      expect(club.inactive?).to be_falsy
    end

    it 'should be an active club until tomorrow' do
      club = create(:club, active_until: Date.today + 1.day)
      expect(club.active?).to be_truthy
      expect(club.inactive?).to be_falsy
    end

    it 'should be an inactive club' do
      club = create(:club, active_until: Date.today - 1.day)
      expect(club.active?).to be_falsy
      expect(club.inactive?).to be_truthy
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
