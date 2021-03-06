class ReviewsController < ApplicationController

  
  def new 
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end
  
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
      if @review.save
        flash[:notice] = "New Review Created Successfully"  #Think about adding string interpolation for Review name.
        redirect_to product_path(@product)
      else
        flash[:alert] = "There was an error while creating Review"
        render :new
      end
  end 

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end
  
  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end  
  
  def update
    @review = Review.find(params[:id])
      if @review.update(review_params)
         flash[:notice] = "Review Updated Successfully"  #Think about adding string interpolation for Review name.
         redirect_to product_path(@review.product)
      else
        flash[:alert] = "There was an error while updating Review"
        render :edit
      end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review Deleted"
    redirect_to reviews_path
  end  
  
  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end  
end  