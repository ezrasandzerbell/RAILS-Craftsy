class ReviewsController < ApplicationController
  def show
      @product = Product.find(params[:product_id])
      review = Review.find(params[:id])
      @productArray = review.findReviewgedProducts
    end

    def new
      @product = Product.find(params[:product_id])
      @review = @product.reviews.new
    end

    def create
      @product = Product.find(params[:product_id])
      @review = @product.reviews.new(review_params)
      @review.name = @product.user.name
      if @review.save
        flash[:notice] = "Review added!"
        redirect_to product_path(@product)
      else
        flash[:notice] = "Review not added!"
        render :new
      end
    end

    def destroy
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      @review.destroy
      flash[:notice] = "Review deleted!"
      redirect_to product_path(@product)
    end

  private
    def review_params
      params.require(:review).permit(:title, :content)
    end
  end
