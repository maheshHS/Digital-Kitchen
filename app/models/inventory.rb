class Inventory < ApplicationRecord
    
    has_many :merge_tables
    #has_one :merge_table
    has_many :items, :through => :merge_tables, :dependent => :destroy
    accepts_nested_attributes_for :items, allow_destroy: true
    #validates :user_id, presence: true
end