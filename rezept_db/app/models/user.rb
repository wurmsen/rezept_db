class User < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :first_name, :last_name
  has_many :recipes

  def display_name
    [first_name, last_name].compact.join(" ")
  end
end
