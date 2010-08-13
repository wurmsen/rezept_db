require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  def test_display_name
    assert_equal "Thomas Wurm", users(:admin).display_name
  end
end
