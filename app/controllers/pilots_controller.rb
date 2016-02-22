class PilotsController < ApplicationController
  authorize_resource

  before_action :set_pilot, only: [:show, :edit, :update, :destroy]

  def index
    @pilots = current_club.pilots.search params[:search]

    respond_to do |format|
      format.html { @pilots = @pilots.page(params[:page]) }
      format.xls  do
        render xls: t('pages.pilots.filename.xls', timestamp: l(Time.zone.now, format: :export))
      end
    end
  end

  def show
  end

  def new
    @pilot = current_club.pilots.new
  end

  def edit
  end

  def create
    @pilot = current_club.pilots.new(pilot_params)
    @pilot.skip_confirmation!

    if @pilot.save
      redirect_to new_pilot_path, notice: t('pages.pilots.labels.notices.create')
    else
      render :new
    end
  end

  def update
    if @pilot.update(pilot_params)
      redirect_to edit_pilot_path(@pilot), notice: t('pages.pilots.labels.notices.update')
    else
      render :edit
    end
  end

  def destroy
    @pilot.destroy
    redirect_to pilots_url, notice: t('pages.pilots.labels.notices.destroy')
  end

  private

  def set_pilot
    @pilot = current_club.pilots.friendly.find(params[:id])
  end

  def pilot_params
    params.require(:pilot).permit(:email, :first_name, :last_name, :avatar, :remove_avatar)
  end
end
