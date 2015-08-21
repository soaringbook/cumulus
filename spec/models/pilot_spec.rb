require 'rails_helper'

describe Pilot do
  context 'Validations' do
    it { should validate_presence_of(:club) }

    it 'should have a valid factory' do
      pilot = create(:pilot)
      expect(pilot.valid?).to be_truthy
    end
  end

  context 'Associations' do
    it { should belong_to(:club) }
  end
end
