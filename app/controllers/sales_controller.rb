class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @customers = Customer.all
    @products = Product.in_stock
  end

  def create
    sale = Sale.create(sale_params.except(:products_ids))

    redirect_to sales_index_path
  end

  def show
  end

  def edit
  end

  def delete
  end

  private

  def sale_params
    params.require(:sale).permit!
  end
end
