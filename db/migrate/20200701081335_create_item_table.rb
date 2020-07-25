class CreateItemTable < ActiveRecord::Migration[6.0]
  def change
    create_table :item_tables do |t|
        t.string :title
        t.string :description
        t.datetime :created_at
        t.datetime :updated_at
    end
  end
end
