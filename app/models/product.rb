class Product < ActiveRecord::Base
	
	belongs_to :brand
	belongs_to :type
	has_many :ingredients
	#has_and_belongs_to_many :types


	validates :product_cname, :presence => true
	validates :product_name, :presence => true
	validates :type_id, :presence => true
end
