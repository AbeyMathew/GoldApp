class GoldValueInquiry < ActiveRecord::Base
	belongs_to :user
	validates :UserId, presence: true
end
