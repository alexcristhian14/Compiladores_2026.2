# Objetivo: Criar uma calculadora de notas que recebe as notas de um aluno, calcula sua média e informa sua situação final.

defmodule CalculadoraNotas do
  def calcular_media(nota1, nota2, nota3) do
    (nota1 + nota2 + nota3) / 3
  end

  def situacao(media) do
    cond do
      media >= 7 -> "Aprovado"
      media >= 5 -> "Recuperação"
      true -> "Reprovado"
    end
  end
end

nota1 = IO.gets("Digite a primeira nota: ") |> String.trim() |> Float.parse() |> elem(0)
nota2 = IO.gets("Digite a segunda nota: ") |> String.trim() |> Float.parse() |> elem(0)
nota3 = IO.gets("Digite a terceira nota: ") |> String.trim() |> Float.parse() |> elem(0)

IO.puts("\nCalculando a média e a situação final...\n")

media = CalculadoraNotas.calcular_media(nota1, nota2, nota3)

IO.puts("===== Resultado =====")
IO.puts("Notas: #{nota1}, #{nota2}, #{nota3}")
IO.puts("Média: #{Float.round(media,2)}")
IO.puts("Situação Final: #{CalculadoraNotas.situacao(media)}")
IO.puts("=====================")
