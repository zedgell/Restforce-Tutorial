require "application_system_test_case"

class FirstnamesTest < ApplicationSystemTestCase
  setup do
    @firstname = firstnames(:one)
  end

  test "visiting the index" do
    visit firstnames_url
    assert_selector "h1", text: "Firstnames"
  end

  test "creating a Firstname" do
    visit firstnames_url
    click_on "New Firstname"

    fill_in "Company", with: @firstname.company
    fill_in "Email", with: @firstname.email
    fill_in "Lastname", with: @firstname.lastname
    fill_in "Phone", with: @firstname.phone
    click_on "Create Firstname"

    assert_text "Firstname was successfully created"
    click_on "Back"
  end

  test "updating a Firstname" do
    visit firstnames_url
    click_on "Edit", match: :first

    fill_in "Company", with: @firstname.company
    fill_in "Email", with: @firstname.email
    fill_in "Lastname", with: @firstname.lastname
    fill_in "Phone", with: @firstname.phone
    click_on "Update Firstname"

    assert_text "Firstname was successfully updated"
    click_on "Back"
  end

  test "destroying a Firstname" do
    visit firstnames_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Firstname was successfully destroyed"
  end
end
