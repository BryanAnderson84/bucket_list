require 'test_helper'

class BucketlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bucketlists_new_url
    assert_response :success
  end

end
