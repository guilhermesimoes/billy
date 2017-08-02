require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get the landing page when not authenticated" do
    get root_url
    assert_response :success
    assert_template :landing
  end

  test "should get the home page when authenticated" do
    sign_in users(:adam)
    get root_url
    assert_response :success
    assert_template :home
  end
end
