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
    it { should have_many(:pilots) }
    it { should have_many(:gliders) }
  end
end
