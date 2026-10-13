#Objetivo: Demonstrar a criação e a chamada de funções em Elixir, utilizando parâmetros, retorno de valores e divisão do programa em subprogramas.

defmodule SistemaNotas do

  def calcular_media(nota1, nota2, nota3) do
    (nota1 + nota2 + nota3) / 3
  end

  def verificar_situacao(media) do
    if media >= 7.0 do
      "Aprovado"
    else
      "Reprovado"
    end
  end

  def ler_nota(mensagem) do
    texto = IO.gets(mensagem) |> String.trim()

    case Float.parse(texto) do
      {nota, ""} ->
        nota

      _ ->
        case Integer.parse(texto) do
          {nota, ""} ->
            nota * 1.0

          _ ->
            IO.puts("Entrada inválida! Digite uma nota numérica.")
            ler_nota(mensagem)
        end
    end
  end

  def exibir_relatorio(nome, nota1, nota2, nota3) do
    media = calcular_media(nota1, nota2, nota3)
    situacao = verificar_situacao(media)

    IO.puts("\n===== RELATÓRIO DO ALUNO =====")
    IO.puts("Nome: #{nome}")
    IO.puts("Nota 1: #{nota1}")
    IO.puts("Nota 2: #{nota2}")
    IO.puts("Nota 3: #{nota3}")
    IO.puts("Média: #{Float.round(media, 2)}")
    IO.puts("Situação: #{situacao}")
  end
end


IO.puts("===== SISTEMA DE NOTAS =====")

nome = IO.gets("Digite o nome do aluno: ") |> String.trim()

nota1 = SistemaNotas.ler_nota("Digite a primeira nota: ")
nota2 = SistemaNotas.ler_nota("Digite a segunda nota: ")
nota3 = SistemaNotas.ler_nota("Digite a terceira nota: ")

SistemaNotas.exibir_relatorio(nome, nota1, nota2, nota3)
