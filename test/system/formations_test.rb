require "application_system_test_case"

class FormationsTest < ApplicationSystemTestCase
  setup do
    @formation = formations(:one)
  end

  test "visiting the index" do
    visit formations_url
    assert_selector "h1", text: "Formations"
  end

  test "creating a Formation" do
    visit formations_url
    click_on "New Formation"

    fill_in "Formation type", with: @formation.formation_type_id
    fill_in "Name", with: @formation.name
    click_on "Create Formation"

    assert_text "Formation was successfully created"
    click_on "Back"
  end

  test "updating a Formation" do
    visit formations_url
    click_on "Edit", match: :first

    fill_in "Formation type", with: @formation.formation_type_id
    fill_in "Name", with: @formation.name
    click_on "Update Formation"

    assert_text "Formation was successfully updated"
    click_on "Back"
  end

  test "destroying a Formation" do
    visit formations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Formation was successfully destroyed"
  end
end
