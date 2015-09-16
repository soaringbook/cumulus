require 'rails_helper'

describe Plan do
  context 'Creations' do
    it 'should create a cumulus plan' do
      plan = Plan.cumulus
      Plan.cumulus
      expect(plan.stripe_id).to eq('cumulus')
      expect(Plan.count).to eq(1)
    end

    it 'should create a cumulus no trial plan' do
      plan = Plan.cumulus_no_trial
      Plan.cumulus_no_trial
      expect(plan.stripe_id).to eq('cumulus_no_trial')
      expect(Plan.count).to eq(1)
    end
  end

  context 'Calculations' do
    it 'should return the correct decimal amount' do
      expect(Plan.cumulus.decimal_amount).to be_within(0.0).of(30.0)
    end
  end
end
