module Clubs
  class PilotsController < ApplicationController
    authorize_resource :club

    before_action :set_club

    respond_to :html, :json

    def new
      @pilot = @club.pilots.build
      respond_modal_with @pilot
    end

    def create
      @pilot = current_club.pilots.build(pilot_params)
      @pilot.admin = true
      @pilot.save
    end

    private

    def set_club
      @club = Club.friendly.find(params[:club_id])
    end

    def pilot_params
      params.require(:pilot).permit(:email, :first_name, :last_name)
    end
  end
end
