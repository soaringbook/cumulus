class GlidersController < ApplicationController
  before_action :set_glider, only: [:show, :edit, :update, :destroy]

  def index
    @gliders = current_club.gliders.search params[:search]
  end

  def show
  end

  def new
    @glider = Glider.new
  end

  def edit
  end

  def create
    @glider = Glider.new(glider_params)

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
    @glider = Glider.find(params[:id])
  end

  def glider_params
    params.require(:glider).permit(:immatriculation, :name, :double_seater, :self_launching)
  end
end
