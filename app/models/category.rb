class Category < ActiveRecord::Base
  has_many :recipes

  scope :ordered, :order => "display_order ASC"
end
