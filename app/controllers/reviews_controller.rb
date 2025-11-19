class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Avis ajouté avec succès !"
    else
      render "restaurants/show", status: :unprocessable_content
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
