class Purchase < ApplicationRecord
  
    has_many :purchaseitems
    has_many :items, :through => :purchaseitems, :dependent => :destroy
    accepts_nested_attributes_for :items, allow_destroy: true
    #validates :user , presence: true
end