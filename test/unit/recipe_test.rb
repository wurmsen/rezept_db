require File.dirname(__FILE__) + '/../test_helper'

class RecipeTest < ActiveSupport::TestCase
  def test_recipe_can_only_be_edited_by_creator
    recipe = recipes(:wurstbrot)
    allowed_user = users(:admin)
    assert_equal true, recipe.user_allowed_to_edit?(allowed_user)

    not_allowed_user = users(:dummy_1)
    assert_equal false, recipe.user_allowed_to_edit?(not_allowed_user)
  end
end
