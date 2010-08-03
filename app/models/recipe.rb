class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients

  validates_presence_of :name, :directions, :user_id

  def user_allowed_to_edit?(current_user)
    user == current_user
  end
end
