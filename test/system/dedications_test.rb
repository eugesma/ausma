require "application_system_test_case"

class DedicationsTest < ApplicationSystemTestCase
  setup do
    @dedication = dedications(:one)
  end

  test "visiting the index" do
    visit dedications_url
    assert_selector "h1", text: "Dedications"
  end

  test "creating a Dedication" do
    visit dedications_url
    click_on "New Dedication"

    fill_in "Hours", with: @dedication.hours
    fill_in "Name", with: @dedication.name
    click_on "Create Dedication"

    assert_text "Dedication was successfully created"
    click_on "Back"
  end

  test "updating a Dedication" do
    visit dedications_url
    click_on "Edit", match: :first

    fill_in "Hours", with: @dedication.hours
    fill_in "Name", with: @dedication.name
    click_on "Update Dedication"

    assert_text "Dedication was successfully updated"
    click_on "Back"
  end

  test "destroying a Dedication" do
    visit dedications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dedication was successfully destroyed"
  end
end
