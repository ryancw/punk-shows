class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :edit]
  before_filter :correct_user,   only: [:destroy, :edit]


def calendar
  @microposts = Micropost.find(:all)
  @date = params[:month] ? Date.parse(params[:month]) : Date.today
end

def new
  @micropost = Micropost.new
end

def show
    @micropost = Micropost.find(params[:id])
  end

def edit
  @micropost = Micropost.find(params[:id])
end

def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(params[:micropost])
      flash[:success] = "show updated"
      redirect_to @micropost
    else
      render 'edit'
    end
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "show created! good job!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
  end
