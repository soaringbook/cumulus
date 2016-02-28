class Clubs::PilotsController < ApplicationController
  authorize_resource

  before_action :set_club

  respond_to :html, :json

  def new
    @pilot = @club.pilots.build
    respond_modal_with @pilot
  end

  def create
  end

  private

  def set_club
    @club = Club.friendly.find(params[:club_id])
  end
end
