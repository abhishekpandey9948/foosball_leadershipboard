require "application_system_test_case"

class NayyarsTest < ApplicationSystemTestCase
  setup do
    @nayyar = nayyars(:one)
  end

  test "visiting the index" do
    visit nayyars_url
    assert_selector "h1", text: "Nayyars"
  end

  test "creating a Nayyar" do
    visit nayyars_url
    click_on "New Nayyar"

    fill_in "Age", with: @nayyar.age
    fill_in "Name", with: @nayyar.name
    click_on "Create Nayyar"

    assert_text "Nayyar was successfully created"
    click_on "Back"
  end

  test "updating a Nayyar" do
    visit nayyars_url
    click_on "Edit", match: :first

    fill_in "Age", with: @nayyar.age
    fill_in "Name", with: @nayyar.name
    click_on "Update Nayyar"

    assert_text "Nayyar was successfully updated"
    click_on "Back"
  end

  test "destroying a Nayyar" do
    visit nayyars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nayyar was successfully destroyed"
  end
end
