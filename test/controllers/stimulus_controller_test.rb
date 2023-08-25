require "test_helper"

class StimulusControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get stimulus_search_url
    assert_response :success
  end
end
