class Category < ActiveRecord::Base
  has_many :recipes

  named_scope :ordered, :order => "display_order ASC"
end
