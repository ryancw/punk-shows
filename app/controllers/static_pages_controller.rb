class StaticPagesController < ApplicationController
 def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = Micropost.where('date >= ?', Date.today)
      @past_items = Micropost.where('date < ?', Date.today)
      @feed_itemsz = current_user.feed.paginate(page: params[:page])
    else
      @feed_items = Micropost.where('date >= ?', Date.today)
      @past_items = Micropost.where('date < ?', Date.today)
    end
  end


  def help
  end

  def about
  end

  def contact
  end
end
