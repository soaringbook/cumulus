require 'rails_helper'

describe Glider do
  context 'Validations' do
    it 'should have a valid factory' do
      glider = create(:glider)
      expect(glider.valid?).to be_truthy
    end
  end
end
