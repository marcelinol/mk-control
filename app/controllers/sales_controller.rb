class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @customers = Customer.all
    @products = Product.in_stock
  end

  def create
    sale_attr = { consultant_id: 1 }.merge(sale_params.except(:products_ids))
    sale = Sale.new(sale_attr)
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
