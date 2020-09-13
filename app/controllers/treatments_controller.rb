class TreatmentsController < ApplicationController
  def new
    @treatment = Treatment.new
  end
end
