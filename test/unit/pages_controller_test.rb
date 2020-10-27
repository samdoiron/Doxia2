require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "renders without errors" do
    get :index
    assert_response :ok
  end
end
