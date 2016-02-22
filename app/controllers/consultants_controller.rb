class ConsultantsController < ApplicationController
  def initial_setup
    @consultant = current_user.consultant
    render layout: 'dedicated'
  end

  def update
    @consultant = current_user.consultant

    if @consultant.update_attributes(consultant_params)
      flash[:success] = 'Dados atualizados com sucesso!'
      redirect_to :root
    else
      flash[:alert] = 'Deu ruim :('
      render nothing: true
    end
  end

  private

  def consultant_params
    params.require(:consultant).permit!
  end
end
