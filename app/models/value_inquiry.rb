class ValueInquiry < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :karat, presence: true, length: { maximum: 8 }
	validates :weight, presence: true, length: { maximum: 8 }
	validates :market_price, presence: true, length: { maximum: 8 }
	validates :value, presence: true, length: { maximum: 8 }
	validates :user_id, presence: true
end
