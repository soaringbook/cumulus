class Import::GlidersController < ApplicationController
  include Wicked::Wizard

  steps :upload,
        :review,
        :result

  def show
    render_wizard
  end
end
