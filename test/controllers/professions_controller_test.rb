require 'test_helper'

class ProfessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professions_index_url
    assert_response :success
  end

  test "should get new" do
    get professions_new_url
    assert_response :success
  end

  test "should get create" do
    get professions_create_url
    assert_response :success
  end

  test "should get update" do
    get professions_update_url
    assert_response :success
  end

  test "should get delete" do
    get professions_delete_url
    assert_response :success
  end

end
