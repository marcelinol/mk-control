class SalesController < ApplicationController
  def index
    @sales = Sale.where(consultant: current_user.consultant)
  end

  def new
    @customers = Customer.where(consultant: current_user.consultant)
    @products = Product.where(consultant: current_user.consultant).in_stock
  end

  def create
    sale_attr = { consultant: current_user.consultant }.merge(sale_params.except(:products_ids))
    sale = Sale.create(sale_attr)
    if sale.valid?
      products_ids = sale_params[:products_ids].reject(&:blank?)
      Product.where(id: products_ids).each do |product|
        product.sale = sale
        product.sold!
        product.save
      end
      sale.save
    end

    redirect_to schedule_contact_with_customer_path(id: sale_params[:customer_id])
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
