class DashboardController < ApplicationController
  def index
    @consultant = Consultant.first
    @customers_for_today = Customer.must_contact_today.where(consultant: @consultant).pluck(:name)
  end
end
