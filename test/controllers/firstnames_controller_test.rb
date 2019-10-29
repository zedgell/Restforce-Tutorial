require 'test_helper'

class FirstnamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @firstname = firstnames(:one)
  end

  test "should get index" do
    get firstnames_url
    assert_response :success
  end

  test "should get new" do
    get new_firstname_url
    assert_response :success
  end

  test "should create firstname" do
    assert_difference('Firstname.count') do
      post firstnames_url, params: { firstname: { company: @firstname.company, email: @firstname.email, lastname: @firstname.lastname, phone: @firstname.phone } }
    end

    assert_redirected_to firstname_url(Firstname.last)
  end

  test "should show firstname" do
    get firstname_url(@firstname)
    assert_response :success
  end

  test "should get edit" do
    get edit_firstname_url(@firstname)
    assert_response :success
  end

  test "should update firstname" do
    patch firstname_url(@firstname), params: { firstname: { company: @firstname.company, email: @firstname.email, lastname: @firstname.lastname, phone: @firstname.phone } }
    assert_redirected_to firstname_url(@firstname)
  end

  test "should destroy firstname" do
    assert_difference('Firstname.count', -1) do
      delete firstname_url(@firstname)
    end

    assert_redirected_to firstnames_url
  end
end
