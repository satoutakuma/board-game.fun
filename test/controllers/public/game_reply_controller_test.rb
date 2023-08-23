require "test_helper"

class Public::GameReplyControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_game_reply_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_game_reply_destroy_url
    assert_response :success
  end
end
