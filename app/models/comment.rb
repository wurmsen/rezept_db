class Comment < ActiveRecord::Base
  belongs_to :recipe
  validates_presence_of :recipe_id, :user_id, :comment
end
