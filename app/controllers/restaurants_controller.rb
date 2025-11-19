class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @restaurants = @restaurants.search(params[:search]) if params[:search].present?
    @restaurants = @restaurants.by_category(params[:category]) if params[:category].present?
    @restaurants = @restaurants.sorted_by(params[:sort_by] || "created_at")
    @categories = ["chinese", "italian", "japanese", "french", "belgian"]
    @total_restaurants = Restaurant.count
    @total_reviews = Review.count

    # Top restaurants (ceux avec au moins un avis et une note moyenne > 0)
    @top_restaurants = Restaurant.all.select { |r| r.average_rating > 0 }
                                  .sort_by { |r| -r.average_rating }
                                  .first(3)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "Restaurant créé avec succès !"
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
