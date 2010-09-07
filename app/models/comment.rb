class Comment < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  validates_presence_of :recipe_id, :user_id, :comment

  MAX_RATING = 5

  def not_rated_stars_count
    MAX_RATING - rating
  end
end
