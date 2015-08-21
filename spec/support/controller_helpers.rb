module ControllerHelpers
  def sign_in(pilot = double(:pilot))
    @pilot = pilot
    allow(request.env['warden']).to receive(:authenticate!) { pilot }
    allow(controller).to receive(:current_pilot) { pilot }
  end

  def redirect_for_login(&block)
    yield
    redirect_to(new_pilot_session_path)
  end

  def redirect_to_path(path, &block)
    yield
    redirect_to(path)
  end

  def render_template_name(template_name, &block)
    yield
    render_template template_name
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerHelpers,   type: :controller
end
