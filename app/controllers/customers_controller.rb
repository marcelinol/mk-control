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
    @customer = Customer
      .where(consultant_id: current_user.consultant)
      .find(params[:id])
      .decorate
  end

  def edit
    @customer = Customer
      .where(consultant: current_user.consultant)
      .find(params[:id])
  end

  def update
    @customer = Customer
      .where(consultant: current_user.consultant)
      .find(params[:id])

    if @customer.update_attributes(customer_params)
      flash[:success] = "Tudo certo!"
      redirect_to customers_index_path
    else
      flash[:failure] = "Algo deu errado"
      render nothing: true
    end
  end

  def schedule_contact
    @customer = Customer
    .where(consultant: current_user.consultant)
    .find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :source, :email, :observations, :next_contact_date, :cellphone, :phone, :address)
  end
end
