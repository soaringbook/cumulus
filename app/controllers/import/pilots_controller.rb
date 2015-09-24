module Import
  class PilotsController < ApplicationController
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
      authorize! :create, Pilot
    end

    def handle_upload
      service = ImportService.new(Pilot, params[:import_object])
      if service.validate_for current_club
        @valid_pilots, @invalid_pilots = service.records
        render(:review)
      else
        @import_object = service.object
        render(:upload)
      end
    end

    def handle_result
      @pilots, @failed_pilots = Pilot.import(params[:review][:records], current_club)
      render(:result)
    end
  end
end
