require 'test_helper'

class AfpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @afp = afps(:one)
  end

  test "should get index" do
    get afps_url
    assert_response :success
  end

  test "should get new" do
    get new_afp_url
    assert_response :success
  end

  test "should create afp" do
    assert_difference('Afp.count') do
      post afps_url, params: { afp: { description: @afp.description, percentage: @afp.percentage } }
    end

    assert_redirected_to afp_url(Afp.last)
  end

  test "should show afp" do
    get afp_url(@afp)
    assert_response :success
  end

  test "should get edit" do
    get edit_afp_url(@afp)
    assert_response :success
  end

  test "should update afp" do
    patch afp_url(@afp), params: { afp: { description: @afp.description, percentage: @afp.percentage } }
    assert_redirected_to afp_url(@afp)
  end

  test "should destroy afp" do
    assert_difference('Afp.count', -1) do
      delete afp_url(@afp)
    end

    assert_redirected_to afps_url
  end
end
