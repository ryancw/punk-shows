class Show < ActiveRecord::Base
  attr_accessible :content, :date, :location, :acts, :details, :fblink, :flyerlink, :altlink
  belongs_to :user
  has_many :bands

  validates :location, presence: true, length: { maximum: 140 }
  validates :date, presence: true
  validates :acts, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  #default_scope :order => 'shows.date ASC'

  # Returns shows from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

self.per_page = 25
  def to_param
    "#{id} #{acts}".parameterize
  end


def link
  if(self.date.year == Date.today.year)
    "#{self.date.month}/#{self.date.day} - #{self.acts} @ #{self.location}"
  else
    "#{self.date.month}/#{self.date.day}/#{self.date.year} - #{self.acts} @ #{self.location}"
  end
end

def title_link
  "#{self.acts} @ #{self.location} - #{self.date.month}/#{self.date.day}/#{self.date.year}"
end


  private

    # Returns an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      followed_user_ids = %(SELECT followed_id FROM relationships
                            WHERE follower_id = :user_id)
      where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
            { user_id: user })
    end
end