require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get movies_home_url
    assert_response :success
  end

  test "should get create" do
    get movies_create_url
    assert_response :success
  end

  test "should get search" do
    get movies_search_url
    assert_response :success
  end

end
