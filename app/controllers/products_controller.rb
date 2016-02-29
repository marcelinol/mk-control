class ProductsController < ApplicationController
  def index
    if params[:status]
      @products = Product.where(consultant: current_user.consultant).send(params[:status])
    else
      @products = Product.where(consultant: current_user.consultant)
    end
  end

  def show
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

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
    params.require(:product).permit!
  end
end
