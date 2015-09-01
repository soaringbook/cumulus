module ControllerHelpers
  def sign_in(pilot = double(:pilot))
    @pilot = pilot
    allow(request.env['warden']).to receive(:authenticate!) { pilot }
    allow(controller).to receive(:current_pilot) { pilot }
  end

  def redirect_for_login(&_block)
    yield
    redirect_to(new_pilot_session_path)
  end

  def redirect_to_path(path, &_block)
    yield
    redirect_to(path)
  end

  def render_template_name(template_name, &_block)
    yield
    render_template template_name
  end

  def press_enter
    keypress = "var e = $.Event('keydown', { keyCode: 13 }); $('body').trigger(e);"
    page.driver.execute_script(keypress)
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerHelpers,   type: :controller
  config.include ControllerHelpers,   type: :feature
end
