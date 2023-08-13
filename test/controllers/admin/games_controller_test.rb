require "test_helper"

class Admin::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_games_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_games_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_games_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_games_update_url
    assert_response :success
  end
end
