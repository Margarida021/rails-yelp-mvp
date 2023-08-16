class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
