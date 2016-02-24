class ClubsController < ApplicationController
  authorize_resource

  before_action :set_club, only: [:show, :edit, :update]

  def index
    @clubs = Club.search(params[:search]).page(params[:page])
  end

  def show
  end

  def new
    @club = Club.new
  end

  def edit
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to clubs_path, notice: t('pages.clubs.labels.notices.create')
    else
      render :new
    end
  end

  def update
    if @club.update(club_params)
      redirect_to edit_club_path(@club), notice: t('pages.clubs.labels.notices.update')
    else
      render :edit
    end
  end

  private

  def set_club
    @club = Club.friendly.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:short_name)
  end
end
