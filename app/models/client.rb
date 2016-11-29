class Client < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy
  has_many :carts
  has_many :items, :through => :carts
end
