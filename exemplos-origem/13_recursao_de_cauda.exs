defmodule CarrinhoDeCompras do
  def calcular_total(itens) do
    calcular_total(itens, 0.0)
  end

  defp calcular_total([], acumulador) do
    acumulador
  end

  defp calcular_total([{_produto, preco, quantidade} | resto], acumulador) do
    novo_acumulador = acumulador + (preco * quantidade)
    calcular_total(resto, novo_acumulador)
  end
end

itens_carrinho = [
  {"Teclado Mecanico", 250.00, 1},
  {"Mouse sem fio", 85.50, 2},
  {"Monitor 24 pol", 800.00, 1}
]

IO.puts("=== Calculadora de Carrinho de Compras ===")
IO.puts("Itens no carrinho: #{inspect(itens_carrinho)}\n")

total = CarrinhoDeCompras.calcular_total(itens_carrinho)

IO.puts("Total a pagar: R$ #{total}")