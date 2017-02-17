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
        redirect_to products_path
      else
        flash[:notice] = "Review not added!"
        render :new
      end
    end

    def edit
       @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
      end

      def update
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        if @review.update(review_params)
          flash[:notice] = "Review updated!"
          redirect_to product_path(@product.id)
        else
          render :edit
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
