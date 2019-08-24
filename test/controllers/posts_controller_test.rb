require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get opinion_post" do
    get posts_opinion_post_url
    assert_response :success
  end

  test "should get theme_post" do
    get posts_theme_post_url
    assert_response :success
  end

end
