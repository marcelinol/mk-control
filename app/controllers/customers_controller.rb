class CustomersController < ApplicationController
  def index
    @customers = Customer.where(consultant: current_user.consultant)
  end

  def new
  end

  def create
    current_params = { consultant: current_user.consultant }.merge(customer_params)
    Customer.create(current_params)

    redirect_to customers_index_path
  end

  def show
  end

  def edit
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update_attributes(customer_params)
      flash[:success] = "Profile updated"
      redirect_to :root
    else
      render nothing: true
    end
  end

  def schedule_contact
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :source, :email, :observations, :next_contact_date, :cellphone, :phone, :address)
  end
end
