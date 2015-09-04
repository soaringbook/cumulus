class GlidersController < ApplicationController
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
      redirect_to @glider, notice: 'Glider was successfully created.'
    else
      render :new
    end
  end

  def update
    if @glider.update(glider_params)
      redirect_to @glider, notice: 'Glider was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @glider.destroy
    redirect_to gliders_url, notice: 'Glider was successfully destroyed.'
  end

  private

  def set_glider
    @glider = current_club.gliders.friendly.find(params[:id])
  end

  def glider_params
    params.require(:glider).permit(:immatriculation, :name, :double_seater, :self_launching, :avatar, :remove_avatar)
  end
end
