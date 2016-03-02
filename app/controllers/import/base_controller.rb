module Import
  class BaseController < ApplicationController
    include Wicked::Wizard

    before_action :authorize_resource!

    respond_to :html, :json

    steps :upload,
          :review,
          :result

    def show
      @import_object = ImportObject.new
      render(:upload)
    end

    def csv
      respond_modal_with @import_object
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
      authorize! :create, resource_class
    end

    def handle_upload
      service = ImportService.new(resource_class, params[:import_object])
      if service.validate_for current_club
        @valid_objects, @invalid_objects = service.records
        render(:review)
      else
        @import_object = service.object
        render(:upload)
      end
    end

    def handle_result
      @objects, @failed_objects = resource_class.import(params[:review][:records], current_club)
      render(:result)
    end
  end
end
