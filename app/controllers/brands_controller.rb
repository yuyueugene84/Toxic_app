class BrandsController < ApplicationController

before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]
before_action :brand_setup, :only => [:show, :edit, :update, :destroy]

def index
	@brands = Brand.all
end

def new
	@brand = Brand.new
end

def create
	#@brand = Brand.new(brand_params)
	@brand = Brand.new(brand_params)
	@brand.save

	if @brand.save
    	flash[:success] = "品牌新增成功！"
      redirect_to brands_path
    	#debugger
      # Handle a successful save.
    else
      flash.now[:danger] = "品牌新增失敗！"
      #redirect_to new_brand_path
      render :new
    end
end

#In your controller, use flash when you're redirecting and flash.now when rendering.


def show

	#@brand = Brand.find(params[:id])
	@products = @brand.products
	@product_joined = @products.select("products.id, products.brand_id, products.product_name, products.product_cname, products.type_id, types.type_name, types.type_cname").joins('LEFT OUTER JOIN types ON types.id = products.type_id')
	#@product_joined = Product.select("products.*, types.*").joins('LEFT OUTER JOIN types ON types.id = products.type_id')
	#@type = Type.find(params[@product_type])
	debugger
end

def edit
	#@brand = Brand.find(params[:id])

	# if @group.user != current_user 
	# 	flash[:warning] = "No Permission" 
	# redirec_to root_path
	# end
end

def update
	#@brand = Brand.find(params[:id])
		
	if @brand.update(brand_params)
		redirect_to brands_path(@brand)
	else
		render :edit
	end
end

def destroy
	#@brand = Brand.find(params[:id])
	@delete_msg = "確認要刪除" + @brand.brand_cname + "?"
	@brand.destroy
	redirect_to brands_path
end


private

def brand_params
	params.require(:brand).permit(:brand_name, :brand_cname, :user_id)
end

def brand_setup
	@brand = Brand.find(params[:id])
end



end #end of brands controller
