require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subjects_new_url
    assert_response :success
  end

  test "should get created" do
    get subjects_created_url
    assert_response :success
  end

  test "should get destroy" do
    get subjects_destroy_url
    assert_response :success
  end

end
