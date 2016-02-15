class ProductsController < ApplicationController
  def index
    if params[:status]
      @products = Product.send(params[:status])
    else
      @products = Product.all
    end
  end

  def edit
  end

  def search
    query = params[:query]
    @products = Product.where('name ilike ?', "%#{query}%")

    render 'index'
  end
end
