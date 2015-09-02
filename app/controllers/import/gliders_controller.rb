module Import
  class GlidersController < ApplicationController
    include Wicked::Wizard

    steps :upload,
          :review,
          :result

    def show
      @import_object = ImportObject.new
      render_wizard
    end

    def update
      case step
      when :upload
        handle_upload
      when :result
        handle_result
      end
    end

    private

    def handle_upload
      service = ImportService.new(Glider, upload_params)
      if service.validate_for current_club
        @valid_gliders, @invalid_gliders = service.records
        render(:review)
      else
        @import_object = service.object
        render_wizard
      end
    end

    def handle_result
      @gliders, @failed_gliders = Glider.import(params[:review][:records], current_club)
      render(:result)
    end

    def upload_params
      params.require(:import_object).permit(:csv)
    end
  end
end
