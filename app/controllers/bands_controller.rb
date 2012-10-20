class BandsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :edit]
  before_filter :correct_user,   only: [:destroy, :edit]

def new
  @band = Band.new
end

def show
    @band = Band.find(params[:id])
  end

def edit
  @band = Band.find(params[:id])
end

def update
    @band = Band.find(params[:id])
    if @band.update_attributes(params[:band])
      flash[:success] = "band updated"
      redirect_to @band
    else
      render 'edit'
    end
  end

  def index
    @bands = Band.paginate(page: params[:page])
  end

  def create
    @band = current_user.bands.build(params[:band])
    if @band.save
      flash[:success] = "band created! good job!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @band.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @band = current_user.bands.find_by_id(params[:id])
      redirect_to root_path if @band.nil?
    end

  end