require 'test_helper'

class EntryTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry_type = entry_types(:one)
  end

  test "should get index" do
    get entry_types_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_type_url
    assert_response :success
  end

  test "should create entry_type" do
    assert_difference('EntryType.count') do
      post entry_types_url, params: { entry_type: { description: @entry_type.description } }
    end

    assert_redirected_to entry_type_url(EntryType.last)
  end

  test "should show entry_type" do
    get entry_type_url(@entry_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_type_url(@entry_type)
    assert_response :success
  end

  test "should update entry_type" do
    patch entry_type_url(@entry_type), params: { entry_type: { description: @entry_type.description } }
    assert_redirected_to entry_type_url(@entry_type)
  end

  test "should destroy entry_type" do
    assert_difference('EntryType.count', -1) do
      delete entry_type_url(@entry_type)
    end

    assert_redirected_to entry_types_url
  end
end
