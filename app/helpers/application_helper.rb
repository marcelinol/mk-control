module ApplicationHelper
  def log_in_or_out_button
    if user_signed_in?
      link_to('Sair', destroy_user_session_path, method: :delete, class: 'mk-color')
    else
      link_to('Entrar', new_user_session_path, class: 'mk-color')
    end
  end
end
