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

  context 'Abilities' do
    subject(:ability) { Ability.new(pilot) }
    let(:pilot) { nil }

    context 'Glider rights' do
      before { create(:glider, club: pilot.club) }

      context 'With admin rights' do
        let(:pilot) { create(:pilot, admin: true) }

        it { should be_able_to(:manage, Glider) }
        it { should be_able_to(:manage, pilot.club.gliders.first) }
      end

      context 'With write rights' do
        let(:pilot) { create(:pilot, glider_access: :gliders_writable) }

        it { should be_able_to(:manage, Glider) }
        it { should be_able_to(:manage, pilot.club.gliders.first) }
      end

      context 'With read rights' do
        let(:pilot) { create(:pilot, glider_access: :gliders_readable) }

        it { should_not be_able_to(:manage, Glider) }
        it { should_not be_able_to(:manage, pilot.club.gliders.first) }
        it { should be_able_to(:read, Glider) }
        it { should be_able_to(:read, pilot.club.gliders.first) }
      end

      context 'With read rights' do
        let(:pilot) { create(:pilot) }

        it { should_not be_able_to(:manage, Glider) }
        it { should_not be_able_to(:manage, pilot.club.gliders.first) }
        it { should_not be_able_to(:read, Glider) }
        it { should_not be_able_to(:read, pilot.club.gliders.first) }
      end
    end

    context 'Club rights' do
      before { create(:glider, club: pilot.club) }

      context 'With admin rights' do
        let(:pilot) { create(:pilot, admin: true) }

        it { should_not be_able_to(:manage, Club) }
        it { should be_able_to(:manage, pilot.club) }
      end

      context 'With read rights' do
        let(:pilot) { create(:pilot) }

        it { should_not be_able_to(:manage, Club) }
        it { should_not be_able_to(:manage, pilot.club) }
      end
    end
  end
end
