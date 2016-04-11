class CustomerDecorator < Draper::Decorator
  delegate_all

  def knowledge_source
    model.source
  end

  def address
    model.address || 'Endereço não cadastrado'
  end

  def cellphone
    model.cellphone || 'Celular não cadastrado'
  end

  def last_contact_date
    model.last_contact_date.try(:to_date) || 'Nenhum contato registrado'
  end

  def next_contact_date
    model.next_contact_date.try(:to_date) || 'Nenhum contato agendado'
  end

  def email
    model.email || 'Nenhum email registrado'
  end

  def phone
    model.phone || 'Nenhum telefone registrado'
  end

  def observations
    model.observations || 'Não há observações'
  end

end
