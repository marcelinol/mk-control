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
end
