# Objetivo: Representar um pedido de uma loja utilizando diferentes tipos compostos do Elixir: listas, tuplas e mapas.

cardapio = %{
  1 => {"Hambúrguer", 18.00},
  2 => {"Pizza", 25.00},
  3 => {"Batata frita", 10.00},
  4 => {"Refrigerante", 6.00}
}

IO.puts("===== CARDÁPIO =====")
IO.puts("1 - Hambúrguer ........ R$ 18,00")
IO.puts("2 - Pizza ............. R$ 25,00")
IO.puts("3 - Batata frita ...... R$ 10,00")
IO.puts("4 - Refrigerante ...... R$ 6,00")

opcao =
  IO.gets("\nDigite o número do produto que deseja escolher: ") |> String.trim() |> String.to_integer()

produto = Map.get(cardapio, opcao)

if produto do
  {nome, preco} = produto

  pedido = %{
    produto: nome,
    preco: preco
  }

  IO.puts("\n===== PEDIDO =====")
  IO.puts("Produto: #{pedido.produto}")
  IO.puts("Preço: R$ #{Float.round(pedido.preco, 2)}")
else
  IO.puts("\nProduto não encontrado.")
end
