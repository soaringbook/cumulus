module FeatureHelpers
  def press_enter selector
    element = find(selector)
    element.native.send_key(:Enter)
  end

  def attach_csv(title, filename)
    path = File.join(Rails.root, "spec/fixtures/#{filename}.csv")
    attach_file title, path
  end

  def login_as_pilot(pilot = nil)
    allow_any_instance_of(ApplicationController).to receive(:payment_completed?).and_return(true)
    @pilot = pilot || create(:pilot, admin: true)
    login_as(@pilot, scope: :pilot)
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
