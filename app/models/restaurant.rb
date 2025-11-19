class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  # Calcul de la note moyenne
  def average_rating
    return 0 if reviews.empty?
    reviews.average(:rating).round(1)
  end

  # Nombre d'avis
  def reviews_count
    reviews.count
  end

  # Recherche par nom ou adresse
  scope :search, ->(query) {
    if query.present?
      where("LOWER(name) LIKE ? OR LOWER(address) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%")
    end
  }

  # Filtrage par catégorie
  scope :by_category, ->(category) {
    where(category: category) if category.present?
  }

  # Tri
  scope :sorted_by, ->(sort_by) {
    case sort_by
    when "name"
      order(:name)
    when "rating_desc"
      left_joins(:reviews)
        .group("restaurants.id")
        .select("restaurants.*, COALESCE(AVG(reviews.rating), 0) as avg_rating")
        .order("avg_rating DESC")
    when "rating_asc"
      left_joins(:reviews)
        .group("restaurants.id")
        .select("restaurants.*, COALESCE(AVG(reviews.rating), 0) as avg_rating")
        .order("avg_rating ASC")
    when "reviews_desc"
      left_joins(:reviews)
        .group("restaurants.id")
        .select("restaurants.*, COUNT(reviews.id) as reviews_count")
        .order("reviews_count DESC")
    else
      order(created_at: :desc)
    end
  }
end
