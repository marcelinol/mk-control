class DashboardController < ApplicationController
  def index
    @consultant = Consultant.first
  end
end
