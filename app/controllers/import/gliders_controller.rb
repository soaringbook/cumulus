module Import
  class GlidersController < ApplicationController
    include Wicked::Wizard

    before_action :authorize_resource!

    steps :upload,
          :review,
          :result

    def show
      @import_object = ImportObject.new
      render(:upload)
    end

    def update
      case step
      when :review
        handle_upload
      when :result
        handle_result
      end
    end

    private

    def authorize_resource!
      authorize! :create, Glider
    end

    def handle_upload
      service = ImportService.new(Glider, params[:import_object])
      if service.validate_for current_club
        @valid_gliders, @invalid_gliders = service.records
        render(:review)
      else
        @import_object = service.object
        render(:upload)
      end
    end

    def handle_result
      @gliders, @failed_gliders = Glider.import(params[:review][:records], current_club)
      render(:result)
    end
  end
end
