class Ingredient < ActiveRecord::Base
	belongs_to :product

	validates :ingredient_cname, :presence => true
	validates :ingredient_name, :presence => true
end
