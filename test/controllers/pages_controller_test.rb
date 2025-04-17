require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get users" do
    get pages_users_url
    assert_response :success
  end

  test "should get chats" do
    get pages_chats_url
    assert_response :success
  end

  test "should get messages" do
    get pages_messages_url
    assert_response :success
  end
end
