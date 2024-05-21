# frozen_string_literal: true

class Developers::SpecialtyDropdownComponent < ApplicationComponent
  include Turbo::FramesHelper

  def initialize(specialty_query: nil, turbo_frame: "specialties_dropdown", specialties: Specialty.visible)
    @specialty_query = specialty_query
    @turbo_frame = turbo_frame
    @specialties = specialties
  end
end
