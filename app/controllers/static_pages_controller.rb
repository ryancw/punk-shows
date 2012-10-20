class StaticPagesController < ApplicationController
 def home
    if signed_in?
      @show  = current_user.shows.build
      @feed_items = Show.where('date >= ?', Date.today)
      @past_items = Show.where('date < ?', Date.today).paginate(page: params[:page])
      @feed_itemsz = current_user.feed.paginate(page: params[:page])
      @shows = Show.all
      @date = params[:month] ? Date.parse(params[:month].gsub('-','/')) : Date.today
    else
      @feed_items = Show.where('date >= ?', Date.today)
      @past_items = Show.where('date < ?', Date.today)
      @shows = Show.all
      @date = params[:month] ? Date.parse(params[:month].gsub('-','/')) : Date.today
    end
  end


  def help
  end

  def about
  end

  def contact
  end
end
