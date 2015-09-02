class Import::GlidersController < ApplicationController
  include Wicked::Wizard

  steps :upload,
        :review,
        :result

  def show
    @import_object = ImportObject.new
    render_wizard
  end

  def update
    @import_object = ImportObject.new params[:import_object]
    @import_object.valid?
    render_wizard
  end
end
