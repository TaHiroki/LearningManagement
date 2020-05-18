require 'test_helper'

class ReplysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get replys_index_url
    assert_response :success
  end

end
