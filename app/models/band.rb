class Band < ActiveRecord::Base
	attr_accessible :name, :description, :established, :active, :city
	belongs_to :user

	validates :name, presence: true, length: { maximum: 250 }
	validates :user_id, presence: true
end
