require "test_helper"

class Pricing::StatsTest < ActiveSupport::TestCase
  include DevelopersHelper

  test "visible developers, rounded" do
    9.times { create_developer }
    assert_equal 12, Developer.visible.count
    assert_equal 10, Pricing::Stats.new.developers
  end

  test "developer response rate" do
    create_conversation
    assert_equal 0.5, Pricing::Stats.new.response_rate
  end

  test "new developers per month, rounded" do
    9.times { create_developer }
    assert_equal 10, Pricing::Stats.new.new_devs
  end

  def create_conversation
    conversation = Conversation.create!(developer: developers(:one), business: businesses(:one))
    conversation.messages.create!(sender: conversation.business, body: "Hi!")
  end
end
