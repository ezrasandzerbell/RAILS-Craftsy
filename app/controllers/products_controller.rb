class ProductsController < ApplicationController

  def index
    @products = Product.all
    # @user = current_user
    # @products = @user.products
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(:name => product_params[:name], :details => product_params[:details], :cost => product_params[:cost], :imgfile => product_params[:imgfile])
    if @product.save
      flash[:notice] = "Product added!"
      redirect_to products_path
    else
      flash[:notice] = "Product not added!"
      render :new
    end
  end

  def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:notice] = "Product updated!"
        redirect_to products_path
      else
        render :edit
      end
    end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product deleted!"
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :details, :cost, :imgfile)
  end
end
