require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  subject(:ability) { Ability.new(pilot) }
  let(:pilot) { nil }

  context 'Super admin rights' do
    before { @club = create(:club) }

    context 'With admin rights' do
      let(:pilot) { create(:pilot, super_admin: true) }

      it { should be_able_to(:manage, Club) }
      it { should be_able_to(:manage, pilot.club) }
      it { should be_able_to(:manage, @club) }
    end
  end

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

  context 'Pilot rights' do
    before { create(:pilot, club: pilot.club) }

    context 'With admin rights' do
      let(:pilot) { create(:pilot, admin: true) }

      it { should be_able_to(:manage, Pilot) }
      it { should be_able_to(:manage, pilot.club.pilots.first) }
    end

    context 'With write rights' do
      let(:pilot) { create(:pilot, pilot_access: :pilots_writable) }

      it { should be_able_to(:manage, Pilot) }
      it { should be_able_to(:manage, pilot.club.pilots.first) }
    end

    context 'With read rights' do
      let(:pilot) { create(:pilot, pilot_access: :pilots_readable) }

      it { should_not be_able_to(:manage, Pilot) }
      it { should_not be_able_to(:manage, pilot.club.pilots.first) }
      it { should be_able_to(:read, Pilot) }
      it { should be_able_to(:read, pilot.club.pilots.first) }
    end

    context 'With read rights' do
      let(:pilot) { create(:pilot) }

      it { should_not be_able_to(:manage, Pilot) }
      it { should_not be_able_to(:manage, pilot.club.pilots.first) }
      it { should_not be_able_to(:read, Pilot) }
      it { should_not be_able_to(:read, pilot.club.pilots.first) }
    end
  end
end
