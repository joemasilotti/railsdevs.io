require "application_system_test_case"

class FiltersTest < ApplicationSystemTestCase
  test "freshest sort click adds sort param" do
    visit developers_path
    sort_by "freshest"
    assert_current_path(/sort=freshest/)
  end

  test "developers newest sort click adds sort param" do
    visit developers_path
    sort_by "newest"
    assert_current_path(/sort=newest/)
  end

  test "developers sort order is persisted with work preferences filters" do
    visit developers_path
    find(:css, "[name='include_not_interested']").set(true)
    sort_by "newest"

    assert_current_path(/sort=newest/)
    assert_current_path(/include_not_interested=1/)
  end

  test "applying multiple filters to developers" do
    visit developers_path
    sort_by "newest"

    assert_current_path(/sort=newest/)

    find(:css, "[name='include_not_interested']").set(true)
    find(:css, "input[type=submit]").click

    assert_current_path(/sort=newest/)
    assert_current_path(/include_not_interested=1/)

    find(:css, "#sort button[type='button']")

    sort_by "freshest"

    assert_current_path(/sort=freshest/)
    assert_current_path(/include_not_interested=1/)
  end

  test "select and search for specialty" do
    user = users(:subscribed_business)
    sign_in(user)

    visit developers_path

    # Fill in the input field and submit the form
    specialty = specialties(:ai)
    fill_in "specialty_query", with: specialty.name
    find(:css, "div[id*='search_result_specialty_']").click
    find(:css, "input[type=submit]").click

    assert_current_path(/specialty_ids%5B%5D=#{specialty.id}/)
  end

  def sort_by(sort)
    toggle_sort_dropdown
    find(:css, "#sort button[type='submit'][value='#{sort}']").click
  end

  def toggle_sort_dropdown
    find(:css, "#sort button[type='button']").click
  end
end
