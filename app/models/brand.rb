class Brand < ActiveRecord::Base
	
	has_many :products

	validates :brand_cname, :presence => true
	validates :brand_name, :presence => true
end
