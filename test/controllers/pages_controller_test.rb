require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get feedback_form" do
    get :feedback_form
    assert_response :success
  end

end
