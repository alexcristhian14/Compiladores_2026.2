# Objetivo: Simular pedidos em uma lanchonete utilizando recursão, condicionais e um menu interativo.

defmodule Lanchonete do
  def iniciar do
    cardapio = %{
      1 => {"Hambúrguer", 18.00},
      2 => {"Pizza", 25.00},
      3 => {"Batata frita", 10.00},
      4 => {"Refrigerante", 6.00}
    }

    IO.puts("===== LANCHONETE =====")
    nome = IO.gets("Digite seu nome: ") |> String.trim()

    fazer_pedido(nome, cardapio, [], 0.0)
  end

  def fazer_pedido(nome, cardapio, itens, total) do
    IO.puts("\n===== CARDÁPIO =====")
    Enum.each(cardapio, fn {numero, {produto, preco}} ->
      IO.puts("#{numero} - #{produto}: R$ #{Float.round(preco, 2)}")
    end)

    IO.puts("0 - Finalizar pedido")

    opcao =
      IO.gets("\nEscolha uma opção: ")
      |> String.trim()
      |> Integer.parse()

    case opcao do
      {0, _} ->
        IO.puts("\n===== RESUMO DO PEDIDO =====")
        IO.puts("Cliente: #{nome}")

        IO.puts("\nItens do pedido:")

        Enum.each(Enum.reverse(itens), fn produto ->
          IO.puts("- #{produto}")
        end)

        IO.puts("\nQuantidade de itens: #{length(itens)}")
        IO.puts("Total: R$ #{Float.round(total, 2)}")
        IO.puts("Obrigado pela preferência!")

      {numero, _} when is_map_key(cardapio, numero) ->
        {produto, preco} = Map.fetch!(cardapio, numero)

        IO.puts("#{produto} adicionado ao pedido!")

        fazer_pedido(
          nome,
          cardapio,
          [produto | itens],
          total + preco
        )

      _ ->
        IO.puts("Opção inválida. Tente novamente.")
        fazer_pedido(nome, cardapio, itens, total)
    end
  end
end

Lanchonete.iniciar()
