class AddGoldValueInquiryToUsers < ActiveRecord::Migration
  def change
  	add_column 	:users, :gold_value_inquiry, :string
  	add_index	:users,	:gold_value_inquiry
  end
end
