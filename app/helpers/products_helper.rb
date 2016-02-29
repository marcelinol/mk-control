module ProductsHelper
  def product_status(status)
    product_status_hash[status]
  end

  private

  def product_status_hash
    {
      "in_stock"         => '<color="green">Em Estoque</color>',
      "sold"          => '<color="red">Vendido</color>',
      "sample"        => 'Amostra',
      "to_be_defined" => 'A definir'
    }
  end
end
