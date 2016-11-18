class ReviewsController < ApplicationController

  def new
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @current_user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @output = @restaurant.build_review_with_user_foreign_key(reviews_params, @current_user)
    ReviewedRestaurant.create(user_id: @current_user.id, restaurant_id: @restaurant.id)
    # reviewed_restaurants_output = @current_user.reviewed_restaurants.create({ id: @restaurant.id })
    redirect_to '/restaurants'
  end

private

  def reviews_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
