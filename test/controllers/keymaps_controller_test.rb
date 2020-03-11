require 'test_helper'

class KeymapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get keymaps_index_url
    assert_response :success
  end

  test "should get search" do
    get keymaps_search_url
    assert_response :success
  end

  test "should get show" do
    get keymaps_show_url
    assert_response :success
  end

  test "should get edit" do
    get keymaps_edit_url
    assert_response :success
  end

end
