class Product < ActiveRecord::Base
	
	belongs_to :brand
	has_many :ingredients
	belongs_to :type
	belongs_to :user
	#has_and_belongs_to_many :types


	validates :product_cname, :presence => true
	validates :product_name, :presence => true
	validates :type_id, :presence => true
end
