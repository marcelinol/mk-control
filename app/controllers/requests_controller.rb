class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
  end

  def upload
    uploaded_io = params[:request_csv]
    file_path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(file_path, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    Request.new(consultant: Consultant.first).import_list(file_path)

    redirect_to products_index_path, status: 301
  end
end
