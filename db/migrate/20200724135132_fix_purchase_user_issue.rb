class FixPurchaseUserIssue < ActiveRecord::Migration[6.0]
  def change
    remove_reference :purchases, :user, index: true
    add_column :purchases, :user_id, :integer
  end
end
