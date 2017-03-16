class ReviewsController < ApplicationController

  def create
    user_id = nil
    product_id = params["product_id"]
    if current_user
      user_id = current_user.id
    end
    puts 'params'
    review = Review.new(
      user_id: user_id,
      product_id: product_id,
      description: params.require(:review)["description"],
      rating: params.require(:review)["rating"]
    )
    review.save!
    redirect_to "/products/#{product_id}"
  end

  def destroy
    review = Review.find(params["id"])
    product_id = review.product_id
    review.destroy
    redirect_to "/products/#{product_id}"
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end 

end
