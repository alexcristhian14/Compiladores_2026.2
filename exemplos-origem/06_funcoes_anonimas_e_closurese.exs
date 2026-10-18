IO.puts(" Sistema de Precificação da Loja ")

calcular_imposto = fn preco -> preco * 0.15 end

IO.puts("\n1. Teste de Função Anônima Simples:")
IO.puts("Imposto sobre um produto de R$ 100.00: R$ #{calcular_imposto.(100.0)}")

percentual_desconto_vip = 0.20

aplicar_desconto_vip = fn preco ->
  valor_reduzido = preco * percentual_desconto_vip
  preco - valor_reduzido
end

precos_carrinho = [50.0, 120.0, 200.0, 45.50]

IO.puts("\n2. Processamento de Lista usando Closures:")
IO.puts("Preços originais no carrinho: #{inspect(precos_carrinho)}")

precos_finais = Enum.map(precos_carrinho, aplicar_desconto_vip)

IO.puts("Preços após aplicar desconto VIP (20%): #{inspect(precos_finais)}")

IO.puts("\n3. Uso da sintaxe curta (&):")
precos_com_frete = Enum.map(precos_finais, &(&1 + 15.00))

IO.puts("Preços finais com R$ 15.00 de frete adicionado a cada item: #{inspect(precos_com_frete)}")