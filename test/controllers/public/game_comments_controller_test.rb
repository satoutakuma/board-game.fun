require "test_helper"

class Public::GameCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get public_game_comments_controller_url
    assert_response :success
  end

  test "should get create" do
    get public_game_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_game_comments_destroy_url
    assert_response :success
  end
end
