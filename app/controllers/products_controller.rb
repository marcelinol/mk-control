class ProductsController < ApplicationController
  def index
    if params[:status]
      searched_status = Product.statuses[params[:status]] if Product.statuses.keys.include?(params[:status])
      @products = Product
        .where(consultant: current_user.consultant)
        .where(status: searched_status)
    else
      @products = Product.where(consultant: current_user.consultant)
    end
  end

  def show
  end

  def edit
    @product = current_user.consultant.products.find(params[:id])
  end

  def update
    @product = current_user.consultant.products.find(params[:id])

    if @product.update_attributes(product_params)
      flash[:success] = "Produto editado com sucesso!"
      redirect_to :products
    else
      flash[:error] = 'erro'
      render nothing: true
    end
  end

  def search
    query = params[:query]
    @products = Product.where(consultant: current_user.consultant).where('name ilike ?', "%#{query}%")

    render 'index'
  end

  private

  def product_params
    params.require(:product).permit(:code, :name, :purchase_price, :sales_price, :points, :product_type, :status, :request_id, :consultant_id, :sale_id)
  end
end
