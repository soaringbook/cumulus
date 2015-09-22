class GlidersController < ApplicationController
  authorize_resource

  before_action :set_glider, only: [:show, :edit, :update, :destroy]

  def index
    @gliders = current_club.gliders.search params[:search]

    respond_to do |format|
      format.html { @gliders = @gliders.page(params[:page]) }
      format.xls  do
        render xls: t('pages.gliders.filename.xls', timestamp: l(Time.zone.now, format: :export))
      end
    end
  end

  def show
  end

  def new
    @glider = current_club.gliders.new
  end

  def edit
  end

  def create
    @glider = current_club.gliders.new(glider_params)

    if @glider.save
      redirect_to new_glider_path, notice: t('pages.gliders.labels.notices.create')
    else
      render :new
    end
  end

  def update
    if @glider.update(glider_params)
      redirect_to edit_glider_path(@glider), notice: t('pages.gliders.labels.notices.update')
    else
      render :edit
    end
  end

  def destroy
    @glider.destroy
    redirect_to gliders_url, notice: t('pages.gliders.labels.notices.destroy')
  end

  private

  def set_glider
    @glider = current_club.gliders.friendly.find(params[:id])
  end

  def glider_params
    params.require(:glider).permit(:immatriculation, :name, :double_seater, :self_launching, :avatar, :remove_avatar, :external, pilot_ids: [])
  end
end
