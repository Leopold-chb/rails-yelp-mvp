# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Supprimer les données existantes (optionnel, pour un seed propre)
Restaurant.destroy_all

restaurants = [
  # Restaurants français
  {
    name: "La Tour d'Argent",
    address: "15 Quai de la Tournelle, 75005 Paris",
    phone_number: "01 43 54 23 31",
    category: "french"
  },
  {
    name: "Le Comptoir du Relais",
    address: "9 Carrefour de l'Odéon, 75006 Paris",
    phone_number: "01 44 27 07 50",
    category: "french"
  },
  {
    name: "L'Ami Jean",
    address: "27 Rue Malar, 75007 Paris",
    phone_number: "01 47 05 86 89",
    category: "french"
  },
  {
    name: "Le Chateaubriand",
    address: "129 Avenue Parmentier, 75011 Paris",
    phone_number: "01 43 57 45 95",
    category: "french"
  },
  {
    name: "Septime",
    address: "80 Rue de Charonne, 75011 Paris",
    phone_number: "01 43 67 38 29",
    category: "french"
  },

  # Restaurants italiens
  {
    name: "Pizza Express",
    address: "10 Wardour St, London W1D 6QF",
    phone_number: "+44 20 7734 3232",
    category: "italian"
  },
  {
    name: "Osteria Mozza",
    address: "6602 Melrose Avenue, Los Angeles, CA 90038",
    phone_number: "+1 323-297-0100",
    category: "italian"
  },
  {
    name: "Trattoria da Enzo",
    address: "Via dei Vascellari, 29, 00153 Roma",
    phone_number: "+39 06 581 2260",
    category: "italian"
  },
  {
    name: "L'Antica Pizzeria da Michele",
    address: "Via Cesare Sersale, 1, 80139 Napoli",
    phone_number: "+39 081 553 9204",
    category: "italian"
  },
  {
    name: "Il Gattopardo",
    address: "13-15 West 54th Street, New York, NY 10019",
    phone_number: "+1 212-246-0412",
    category: "italian"
  },

  # Restaurants japonais
  {
    name: "Sushi Samba",
    address: "110 Bishopsgate, London EC2N 4AY",
    phone_number: "+44 20 3640 7330",
    category: "japanese"
  },
  {
    name: "Sukiyabashi Jiro",
    address: "4-2-15 Ginza, Chuo City, Tokyo 104-0061",
    phone_number: "+81 3-3535-3600",
    category: "japanese"
  },
  {
    name: "Nobu",
    address: "105 Hudson Street, New York, NY 10013",
    phone_number: "+1 212-219-0500",
    category: "japanese"
  },
  {
    name: "Kikunoi",
    address: "459 Shimokawara-cho, Yasaka Torii-mae, Higashiyama-ku, Kyoto",
    phone_number: "+81 75-561-0015",
    category: "japanese"
  },
  {
    name: "Sushi Yasuda",
    address: "204 E 43rd St, New York, NY 10017",
    phone_number: "+1 212-972-1001",
    category: "japanese"
  },

  # Restaurants chinois
  {
    name: "Dumplings' Legend",
    address: "15-16 Gerrard St, London W1D 6JE",
    phone_number: "+44 20 7494 1200",
    category: "chinese"
  },
  {
    name: "Din Tai Fung",
    address: "1108 S Baldwin Ave, Arcadia, CA 91007",
    phone_number: "+1 626-574-7068",
    category: "chinese"
  },
  {
    name: "Hakkasan",
    address: "8 Hanway Place, London W1T 1HD",
    phone_number: "+44 20 7927 7000",
    category: "chinese"
  },
  {
    name: "Jing Fong",
    address: "202 Centre St, New York, NY 10013",
    phone_number: "+1 212-964-5256",
    category: "chinese"
  },
  {
    name: "Tim Ho Wan",
    address: "85-93 Shaftesbury Ave, London W1D 5BY",
    phone_number: "+44 20 3598 0600",
    category: "chinese"
  },

  # Restaurants belges
  {
    name: "Belgo Centraal",
    address: "50 Earlham St, London WC2H 9LJ",
    phone_number: "+44 20 7813 2233",
    category: "belgian"
  },
  {
    name: "Chez Léon",
    address: "18 Rue des Bouchers, 1000 Bruxelles",
    phone_number: "+32 2 511 14 15",
    category: "belgian"
  },
  {
    name: "Comme Chez Soi",
    address: "Place Rouppe 23, 1000 Bruxelles",
    phone_number: "+32 2 512 29 21",
    category: "belgian"
  },
  {
    name: "Le Zinneke",
    address: "Place du Châtelain 20, 1050 Ixelles",
    phone_number: "+32 2 512 11 20",
    category: "belgian"
  },
  {
    name: "Brasserie Cantillon",
    address: "Rue Gheude 56, 1070 Anderlecht",
    phone_number: "+32 2 521 49 28",
    category: "belgian"
  }
]

restaurants.each do |restaurant_attrs|
  Restaurant.create!(restaurant_attrs)
end

# Ajouter quelques avis pour rendre l'application plus réaliste
puts "Création de restaurants et d'avis..."

restaurants_with_reviews = Restaurant.limit(10)

restaurants_with_reviews.each do |restaurant|
  # Ajouter 2-5 avis par restaurant
  rand(2..5).times do
    ratings = [3, 4, 5, 4, 5, 5, 4] # Plus de bonnes notes pour rendre ça réaliste
    contents = [
      "Excellent restaurant ! La nourriture était délicieuse et le service impeccable.",
      "Très bon repas, je recommande vivement. L'ambiance était parfaite.",
      "Un peu cher mais ça vaut le coup. Les plats sont raffinés et savoureux.",
      "Super expérience culinaire ! Je reviendrai certainement.",
      "Restaurant de qualité avec une cuisine authentique. Service rapide et professionnel.",
      "Atmosphère agréable et plats savoureux. Parfait pour un dîner en amoureux.",
      "La meilleure expérience culinaire que j'ai eue depuis longtemps. À essayer absolument !",
      "Bon rapport qualité-prix. Les portions sont généreuses et le goût est au rendez-vous.",
      "Restaurant authentique avec des saveurs incroyables. Le personnel est très accueillant.",
      "Un peu déçu par le service mais la nourriture était excellente. À retester."
    ]

    restaurant.reviews.create!(
      rating: ratings.sample,
      content: contents.sample
    )
  end
end

puts "✅ #{Restaurant.count} restaurants créés avec succès !"
puts "✅ #{Review.count} avis créés avec succès !"
