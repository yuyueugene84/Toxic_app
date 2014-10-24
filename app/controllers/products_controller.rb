class ProductsController < ApplicationController

def new
	@brand = Brand.find(params[:brand_id])
	@product = @brand.products.build
	@type = Type.all
	#@product = @brand.products.new(product_params)
	end

def show
	@brand = Brand.find(params[:brand_id])
	@product = @brand.products.find(params[:id])
	@type = Type.find(@product.type_id)
	@ingredients = @product.ingredients
	#@product_joined = Product.select("products.id, products.brand_id, products.product_name, products.product_cname, products.type_id, types.type_name, types.type_cname").joins('LEFT OUTER JOIN types ON types.id = products.type_id')
end

def create
	@brand = Brand.find(params[:brand_id])
	@product = @brand.products.new(product_params)
	@type = Type.all

	if @product.save
    	flash[:success] = "產品新增成功！"
      redirect_to brand_path(@brand)
    	#debugger
      # Handle a successful save.
    else
      flash[:danger] = "產品新增失敗！"
	  #redirect_to new_brand_product_path
	  render :new
    end
end

def edit
	@brand = Brand.find(params[:brand_id])
	@product= @brand.products.find(params[:id])
	@type = Type.all

end

def update
	@brand = Brand.find(params[:brand_id])
	@product = @brand.products.find(params[:id])

	if @product.update(product_params)
	    #redirect_to brand_product_path(@brand, @product)
	    redirect_to brand_path(@brand)
	else
		render :edit
	end
 end

 def destroy
 	@brand = Brand.find(params[:brand_id])
	@product= @brand.products.find(params[:id])

	@product.destroy
	redirect_to brand_path(@brand)
 end

private

def product_params
	params.require(:product).permit(:brand_id, :product_name, :product_cname, :type_id)
end

end
