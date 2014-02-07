class ValueInquiry < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :karat, presence: true, length: { maximum: 8 }
	validates :weight, presence: true, length: { maximum: 8 }, numericality: true#{greater_than: 0, message: "Weight must be a number"}
	validates :market_price, presence: true, length: { maximum: 8 }
	validates :value, presence: true, length: { maximum: 8 }
	validates :user_id, presence: true

#	require application_helper
#	before_save {|ValueInquiry| value_inquiry.value = ((@karat / @pure_gram_karat) * (@market_price / @troy_ounce) * @weight)} 
#	@inquiry = ValueInquiry.find(:last)
#	@inquiry.calculate_value

#	def calculate_value
#		write_attribute(:value, @gold_value)
#	end
end
