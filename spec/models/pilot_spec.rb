require 'rails_helper'

describe Pilot do
  context 'Validations' do
    it 'should have a valid factory' do
      pilot = create(:pilot)
      expect(pilot.valid?).to be_truthy
    end
  end
end
