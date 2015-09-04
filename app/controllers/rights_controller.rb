class RightsController < ApplicationController
  before_action :set_pilot, only: [:edit, :update]

  def index
    @pilots = current_club.pilots.search(params[:search]).page params[:page]
  end

  def edit
  end

  def update
    if @pilots.update(pilot_params)
      redirect_to @pilots, notice: 'Access rights was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_pilot
    @pilots = current_club.pilots.find(params[:id])
  end

  def pilot_params
    params.require(:pilot).permit(:admin, :gliders_access)
  end
end
