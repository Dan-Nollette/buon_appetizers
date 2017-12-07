class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    if current_user && current_user.is_admin
      @product = Product.new
      render :new
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    if current_user && current_user.is_admin
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Product successfully added!"
        redirect_to products_path(@product)
      else
        render :new
      end
    else
      redirect_to new_user_registration_path
    end
  end

  def edit
    if current_user && current_user.is_admin
      @product = Product.find(params[:id])
    else
      redirect_to new_user_registration_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "The comment has been updated."
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
