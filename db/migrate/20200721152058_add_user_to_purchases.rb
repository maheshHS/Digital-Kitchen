class AddUserToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :user, index: true
  end
end
