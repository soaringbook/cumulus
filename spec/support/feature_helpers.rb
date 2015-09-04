module FeatureHelpers
  def press_enter
    keypress = "var e = $.Event('keydown', { keyCode: 13 }); $('body').trigger(e);"
    page.driver.execute_script(keypress)
  end

  def attach_csv(title, filename)
    path = File.join(Rails.root, "spec/fixtures/#{filename}.csv")
    attach_file title, path
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
