class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients, :dependent => :destroy
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  has_one :category

# kommentare
# foto
  validates_presence_of :name, :directions, :user_id, :categroy_id

  def user_allowed_to_edit?(current_user)
    user == current_user
  end
end
