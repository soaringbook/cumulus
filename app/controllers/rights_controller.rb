class RightsController < ApplicationController
  before_action :set_pilot, only: [:edit, :update]

  def index
    @pilots = current_club.pilots.search(params[:search]).page params[:page]
  end

  def edit
  end

  def update
    if @pilot.update(pilot_params)
      redirect_to rights_path, notice: t('pages.rights.labels.notices.update')
    else
      render :edit
    end
  end

  private

  def set_pilot
    @pilot = current_club.pilots.find(params[:pilot_id])
  end

  def pilot_params
    params.require(:pilot).permit(:admin, :glider_access)
  end
end
