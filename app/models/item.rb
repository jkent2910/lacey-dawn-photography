class Item < ActiveRecord::Base
  has_one :picture
  has_many :carts
  has_many :clients, :through => :carts
end
