class CreateValueInquiries < ActiveRecord::Migration
  def change
    create_table :value_inquiries do |t|
      t.decimal :karat
      t.decimal :weight
      t.decimal :market_price
      t.decimal :value
      t.integer :user_id

      t.timestamps
    end
    add_index :value_inquiries, [:user_id, :created_at]
  end
end
