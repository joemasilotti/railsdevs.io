require "test_helper"

class DeveloperQueryComponentTest < ViewComponent::TestCase
  setup do
    @user = users(:empty)
  end

  test "emphasises the selected sorting" do
    query = DeveloperQuery.new(sort: :availability)
    render_inline DeveloperQueryComponent.new(query:, user: @user)

    assert_selector "button.text-gray-700", text: "Newest"
    assert_selector "button.text-gray-900", text: "Availability"
  end

  test "renders unique UTC offset pairs for developers" do
    query = DeveloperQuery.new({})
    render_inline DeveloperQueryComponent.new(query:, user: @user)

    assert_selector "input[type=checkbox][name='utc_offsets[]'][value=#{EASTERN_UTC_OFFSET}]"
    assert_selector "input[type=checkbox][name='utc_offsets[]'][value=#{PACIFIC_UTC_OFFSET}]"

    assert_selector "label[for=utc_offsets_#{EASTERN_UTC_OFFSET}]", text: "GMT-5"
    assert_selector "label[for=utc_offsets_#{PACIFIC_UTC_OFFSET}]", text: "GMT-8"
  end

  test "checks selected timezones" do
    query = DeveloperQuery.new(utc_offsets: [PACIFIC_UTC_OFFSET])
    render_inline DeveloperQueryComponent.new(query:, user: @user)

    assert_no_selector "input[checked][type=checkbox][name='utc_offsets[]'][value=#{EASTERN_UTC_OFFSET}]"
    assert_selector "input[checked][type=checkbox][name='utc_offsets[]'][value=#{PACIFIC_UTC_OFFSET}]"
  end

  test "checks selected role types" do
    query = DeveloperQuery.new(role_types: ["part_time_contract", "full_time_contract"])
    render_inline DeveloperQueryComponent.new(query:, user: @user)

    assert_no_selector "input[checked][type=checkbox][name='role_types[]'][value=full_time_employment]"
    assert_selector "input[checked][type=checkbox][name='role_types[]'][value=part_time_contract]"
    assert_selector "input[checked][type=checkbox][name='role_types[]'][value=full_time_contract]"
  end

  test "checks selected role levels" do
    query = DeveloperQuery.new(role_levels: ["junior", "mid", "senior"])
    render_inline DeveloperQueryComponent.new(query:, user: @user)

    assert_selector "input[checked][type=checkbox][name='role_levels[]'][value=junior]"
    assert_selector "input[checked][type=checkbox][name='role_levels[]'][value=mid]"
    assert_selector "input[checked][type=checkbox][name='role_levels[]'][value=senior]"
    assert_no_selector "input[checked][type=checkbox][name='role_levels[]'][value=principal]"
    assert_no_selector "input[checked][type=checkbox][name='role_levels[]'][value=c_level]"
  end

  test "do not show role level in production" do
    query = DeveloperQuery.new(role_levels: ["junior", "mid", "senior"])
    user = users(:with_complete_profile)
    Rails.stub(:env, ActiveSupport::StringInquirer.new("production")) do
      render_inline DeveloperQueryComponent.new(query:, user:)
    end

    assert_no_text RoleLevel.human_attribute_name("junior")
    assert_no_text RoleLevel.human_attribute_name("senior")
    assert_no_text RoleLevel.human_attribute_name("principal")
    assert_no_text RoleLevel.human_attribute_name("mid")
    assert_no_text RoleLevel.human_attribute_name("c_level")
  end

  test "show selected role levels in production for admin" do
    query = DeveloperQuery.new(role_levels: ["junior", "mid", "senior"])
    user = users(:admin)
    Rails.stub(:env, ActiveSupport::StringInquirer.new("production")) do
      render_inline DeveloperQueryComponent.new(query:, user:)
    end

    assert_text RoleLevel.human_attribute_name("junior")
    assert_text RoleLevel.human_attribute_name("senior")
    assert_text RoleLevel.human_attribute_name("principal")
    assert_text RoleLevel.human_attribute_name("mid")
    assert_text RoleLevel.human_attribute_name("c_level")
  end

  test "checks option to include developers who aren't interested" do
    query = DeveloperQuery.new(include_not_interested: true)
    render_inline DeveloperQueryComponent.new(query:, user: @user)

    assert_selector "input[checked][type=checkbox][name='include_not_interested']"
  end
end
