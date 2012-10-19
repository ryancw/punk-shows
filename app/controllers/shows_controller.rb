class ShowsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :edit]
  before_filter :correct_user,   only: [:destroy, :edit]
  #before_filter :admin_user,     only: [:destroy, :edit]


def calendar
  @shows = Show.find(:all)
  @date = params[:month] ? Date.parse(params[:month]) : Date.today
end

def new
  @show = Show.new
end

def show
    @show = Show.find(params[:id])
  end

def edit
  @show = Show.find(params[:id])
end

def update
    @show = Show.find(params[:id])
    if @show.update_attributes(params[:show])
      flash[:success] = "show updated"
      redirect_to @show
    else
      render 'edit'
    end
  end

  def create
    @show = current_user.shows.build(params[:show])
    if @show.save
      flash[:success] = "show created! good job!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @show.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @show = current_user.shows.find_by_id(params[:id])
      redirect_to root_path if @show.nil?
    end

  end
