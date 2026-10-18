defmodule Matematica do
    def verificar_paridade(numero) when rem(numero, 2) == 0 do
    IO.puts("O número #{numero} é PAR.")
    end

    def verificar_paridade(numero) do
    IO.puts("O número #{numero} é ÍMPAR.")
  end
end

Matematica.verificar_paridade(8)
Matematica.verificar_paridade(15)
Matematica.verificar_paridade(42)