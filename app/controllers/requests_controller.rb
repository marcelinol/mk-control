class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
  end

  def upload
    uploaded_io = params[:request_csv]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    Request.new(Consultant.find(1)).import_list(uploaded_io.original_filename)

    redirect_to requests_index_path, status: 301
  end
end
