class IngredientsController < ApplicationController
	def new
		@brand = Brand.find(params[:brand_id])
		@product = Product.find(params[:product_id])
		@ingredient = @product.ingredients.build
	end

	def show
		@brand = Brand.find(params[:brand_id])	
		@product = Product.find(params[:product_id])
		@ingredient = @product.ingredients.find(params[:id])
	end

	def create
		@brand = Brand.find(params[:brand_id])	
		@product = Product.find(params[:product_id])
		@ingredient = @product.ingredients.new(ingredient_params)

		if @ingredient.save
			flash[:success] = "成分新增成功！"
	 		redirect_to brand_product_path(@brand, @product)
	 	else	
	 		flash.now[:danger] = "成分新增失敗！"
	 		render :new
	 	end
	end

	def edit
		@brand = Brand.find(params[:brand_id])	
		@product = Product.find(params[:product_id])
		@ingredient = @product.ingredients.find(params[:id])
	end

	def update
		@brand = Brand.find(params[:brand_id])
		@product = Product.find(params[:product_id])
		@ingredient = @product.ingredients.find(params[:id])

		if @ingredient.update(ingredient_params)
	       redirect_to brand_product_path(@brand, @product)
		else
		   render :edit
		end
	end

	def destroy
		@brand = Brand.find(params[:brand_id])
		@product = Product.find(params[:product_id])
		@ingredient = @product.ingredients.find(params[:id])

		@ingredient.destroy
		#redirect_to brand_product_path(@product)
		redirect_to brand_product_path(@brand, @product)
	end

private
	def ingredient_params
		params.require(:ingredient).permit(:ingredient_name, :ingredient_cname, :cas_number)
	end
end
