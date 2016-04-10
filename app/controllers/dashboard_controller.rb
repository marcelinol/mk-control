class DashboardController < ApplicationController
  def index
    @consultant = current_user.consultant
    @customers_for_today = Customer.must_contact_today.where(consultant: @consultant)
  end
end
