class SpecialtiesController < ApplicationController
  def index
    @specialty_query = params[:specialty_query]&.strip
    @specialties = Specialty.containing(@specialty_query)
    @turbo_frame = params[:turbo_frame]
  end
end
