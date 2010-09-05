module CommentsHelper
  def build_rating_stars(rating)
    images = ""
    (1..rating.to_i).each do |rated|
      images += image_tag("star_rated.gif")
    end
    images
  end
end