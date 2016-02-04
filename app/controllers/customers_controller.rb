class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
  end

  def create
    Customer.create(customer_params)

    redirect_to customers_index_path
  end

  def show
  end

  def edit
  end

  def schedule_contact
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :source, :email, :observations)
  end
end
