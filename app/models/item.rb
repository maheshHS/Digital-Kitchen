class Item < ApplicationRecord
    #Associations 

    has_many :merge_tables
    #has_one :merge_table
    has_many :inventories, :through => :merge_tables, :dependent => :destroy
    #has_one :join_item, :dependent => :destroy

    #Validations
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :cost, presence: true
    #validates :user_id, presence: true


end