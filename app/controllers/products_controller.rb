class ProductsController < ApplicationController
  def index
    if params[:status]
      @products = Product.where(consultant: current_user.consultant).send(params[:status])
    else
      @products = Product.where(consultant: current_user.consultant)
    end
  end

  def edit
  end

  def update
  end

  def search
    query = params[:query]
    @products = Product.where(consultant: current_user.consultant).where('name ilike ?', "%#{query}%")

    render 'index'
  end
end
