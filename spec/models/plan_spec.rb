require 'rails_helper'

describe Plan do
  context 'Calculations' do
    it 'should return the correct decimal amount' do
      plan = build(:plan, amount: 3000)
      expect(plan.decimal_amount).to be_within(0.0).of(30.0)
    end
  end
end
