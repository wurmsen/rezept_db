class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients, :dependent => :destroy
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  belongs_to :category
  has_many :comments

# kommentare
# foto
  validates_presence_of :name, :directions, :user_id, :category_id

  # Checks if current user is the author of this recipe
  # because only then he is allowed to edit it.
  def user_allowed_to_edit?(current_user)
    user == current_user
  end

  def average_rating
    @average_rating ||= calculate_average_rating
  end
  # Calculates the average user rating
  def calculate_average_rating
    sum = 0
    ratings = comments.map(&:rating)
    ratings.each do |rated|
      sum += rated
    end
    sum / (ratings.size == 0 ? 1 : ratings.size)
  end
end
