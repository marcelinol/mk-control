class RequestsController < ApplicationController
  def index
    @requests = Request.where(consultant: current_user.consultant)
  end

  def new
  end

  def upload
    uploaded_io = params[:request_csv]
    file_path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    if File.exist?(file_path)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_io.read)
      end

      Request.create(consultant: current_user.consultant).import_list(file_path)

      redirect_to products_path, status: 301
    else
      redirect_to new_request_path, status: 411
    end
  end
end
