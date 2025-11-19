module ApplicationHelper
  # Affiche les étoiles pour une note
  def display_stars(rating, size: "fs-5")
    return content_tag(:span, "Aucune note", class: "text-muted") if rating.nil? || rating.zero?

    full_stars = rating.floor
    half_star = (rating - full_stars) >= 0.5
    empty_stars = 5 - full_stars - (half_star ? 1 : 0)

    html = ""
    full_stars.times { html += content_tag(:span, "★", class: "text-warning #{size}") }
    html += content_tag(:span, "½", class: "text-warning #{size}") if half_star
    empty_stars.times { html += content_tag(:span, "★", class: "text-muted #{size}") }
    html += content_tag(:span, " #{rating.round(1)}", class: "ms-2 fw-bold")

    html.html_safe
  end

  # Affiche le nom de la catégorie avec emoji
  def category_with_emoji(category)
    case category
    when "chinese" then "🥢 Chinois"
    when "italian" then "🍝 Italien"
    when "japanese" then "🍣 Japonais"
    when "french" then "🥖 Français"
    when "belgian" then "🍺 Belge"
    else category.capitalize
    end
  end
end
