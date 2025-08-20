require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "GET /api/v1/users returns 200" do
    get "/api/v1/users"
    assert_response :success
  end

  test "GET /api/v1/users/:id returns 404 when not found" do
    get "/api/v1/users/999999"
    assert_response :not_found
  end

  test "GET /api/v1/users/:id returns 200 when exists" do
    user = users(:alice)
    get "/api/v1/users/#{user.id}"
    assert_response :success

    body = JSON.parse(@response.body)
    assert_equal user.id, body["id"]
  end
end
