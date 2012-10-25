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

def past
  @past_items = Show.where('date < ?', Date.today,).order("date DESC").paginate(page: params[:page])
end

#def future
#  @feed_items = Show.where('date >= ?', Date.today)
#    @future_shows = Show.where('date >= ?', Date.today)
#end


def future
  @januarys = Array.new
  @februarys = Array.new
  @marchs = Array.new
  @aprils = Array.new
  @mays = Array.new
  @junes = Array.new
  @julys = Array.new
  @augusts = Array.new
  @septembers = Array.new
  @octobers = Array.new
  @novembers = Array.new
  @decembers = Array.new
  @futures = Show.where('date >= ?', Date.today).sort! { |a,b| a.date <=> b.date }
  for future in @futures
    case future.date.month
    when 1
      @januarys.push future
    when 2
      @februarys.push future
    when 3
      @marchs.push future
    when 4
      @aprils.push future
    when 5
      @mays.push future
    when 6
      @junes.push future
    when 7
      @julys.push future
    when 8
      @augusts.push future
    when 9
      @septembers.push future
    when 10
      @octobers.push future
    when 11
      @novembers.push future
    when 12
      @decembers.push future
    end
  end

 # @januarys.sort! { |a,b| a.date <=> b.date }
  #@februarys.sort! { |a,b| a.date <=> b.date }
 # @marchs.sort! { |a,b| a.date <=> b.date }
 ## @aprils.sort! { |a,b| a.date <=> b.date }
 # @mays.sort! { |a,b| a.date <=> b.date }
 # @junes.sort! { |a,b| a.date <=> b.date }
 # @julys.sort! { |a,b| a.date <=> b.date }
#  @augusts.sort! { |a,b| a.date <=> b.date }
 # @septembers.sort! { |a,b| a.date <=> b.date }
 # @octobers.sort! { |a,b| a.date <=> b.date }
 # @novembers.sort! { |a,b| a.date <=> b.date }
  #@decembers.sort! { |a,b| a.date <=> b.date }
end


def futureshows
  @future_shows = Show.where('date >= ?', Date.today)
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
