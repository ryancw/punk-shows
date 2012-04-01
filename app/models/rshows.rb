class Rshows < ActiveRecord::Base
	attr_accessible :date
	attr_accessible :location
	attr_accessible :acts
	attr_accessible :details
	belongs_to :user

	validates :user_id, presence: true
	default_scope order: 'rshows.date'
end
