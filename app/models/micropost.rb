class Micropost < ActiveRecord::Base
  attr_accessible :content, :date, :location, :acts, :details
  belongs_to :user

  validates :location, presence: true, length: { maximum: 140 }
  validates :date, presence: true
  validates :acts, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

 default_scope :order => 'microposts.date ASC'


def feed
  Micropost.where(!past?(Micropost.date))
end
  # Returns microposts from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }



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