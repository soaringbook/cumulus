require 'rails_helper'
require 'cancan/matchers'

describe Pilot do
  context 'Validations' do
    it { should validate_presence_of(:club) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it 'should have a valid factory' do
      pilot = create(:pilot)
      expect(pilot.valid?).to be_truthy
    end
  end

  context 'Associations' do
    it { should belong_to(:club) }
  end

  context 'Roles' do
    it 'should not be an admin on creation' do
      pilot = create(:pilot)
      expect(pilot.admin?).to be_falsy
    end

    it 'should have no access to gliders on creation' do
      pilot = create(:pilot)
      expect(pilot.gliders_not_accessible?).to be_truthy
    end
  end
end
