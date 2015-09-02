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
        @import_object = ImportObject.new params[:import_object]
        if @import_object.valid?
          gliders = Glider.import_file(params[:import_object][:csv], current_club)
          if gliders.count > 0
            @valid_gliders = gliders.select(&:valid?)
            @invalid_gliders = gliders.select(&:invalid?)
            render(:review) && return
          else
            @import_object.errors.add(:csv, I18n.t('pages.import.upload.errors.no_record'))
          end
        end
      when :result
        @gliders, @failed_gliders = Glider.import(params[:review][:records], current_club)
        render(:result) && return
      end
      render_wizard
    end
  end
end
