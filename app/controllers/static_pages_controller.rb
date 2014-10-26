class StaticPagesController < ApplicationController
	def home
	end

	def search

		@product_branded = Product.joins(:type, :brand)
		@product_joined = Product.select("products.id, products.brand_id, products.product_name, products.product_cname, products.type_id, types.type_name, types.type_cname, brands.brand_name, brands.brand_cname").joins('OUTER JOIN types ON types.id = products.type_id OUTER JOIN brands ON brands.id = products.brand_id')
		#@brand = Brand.find(@product_branded.brand_id)
		#@type = Type.find(@products_branded.type_id)
		#@product_branded = Product.select("brands.brand_cname, brands.brand_name, products.type").joins('LEFT OUTER JOIN types ON brands.id = products.brand_id')
		#@product_branded = Product.includes(:brand)
		#@product_branded = Product.select("brands.*").includes(:brand)
		#Client.where("orders_count = ?", params[:orders])

	end

	def help
	end

	def contact
	end

end
