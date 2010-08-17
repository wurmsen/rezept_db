require File.dirname(__FILE__) + '/../test_helper'

class RecipesControllerTest < ActionController::TestCase
  def test_check_user_is_allowed_to_delete
    login(:admin)
    get :show, :id => 1
    assert_response :success
    assert_tag :tag => "a", :content => "löschen"
  end

  def test_check_user_is_not_allowed_to_delete
    login(:dummy_1)
    get :show, :id => 1
    assert_response :success
    assert_no_tag :tag => "a", :content => "löschen"
  end

  def test_check_user_is_allowed_to_edit
    login(:admin)
    get :show, :id => 1
    assert_response :success
    assert_tag :tag => "a", :content => "bearbeiten"
  end

  def test_check_user_is_not_allowed_to_edit
    login(:dummy_1)
    get :show, :id => 1
    assert_response :success
    assert_no_tag :tag => "a", :content => "bearbeiten"
  end
end
