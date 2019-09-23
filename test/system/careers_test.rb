require "application_system_test_case"

class CareersTest < ApplicationSystemTestCase
  setup do
    @career = careers(:one)
  end

  test "visiting the index" do
    visit careers_url
    assert_selector "h1", text: "Careers"
  end

  test "creating a Career" do
    visit careers_url
    click_on "New Career"

    fill_in "Name", with: @career.name
    fill_in "Year duration", with: @career.year_duration
    click_on "Create Career"

    assert_text "Career was successfully created"
    click_on "Back"
  end

  test "updating a Career" do
    visit careers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @career.name
    fill_in "Year duration", with: @career.year_duration
    click_on "Update Career"

    assert_text "Career was successfully updated"
    click_on "Back"
  end

  test "destroying a Career" do
    visit careers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Career was successfully destroyed"
  end
end
