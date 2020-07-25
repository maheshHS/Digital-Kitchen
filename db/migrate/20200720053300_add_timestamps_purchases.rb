class AddTimestampsPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :created_at, :datetime
  end
end
