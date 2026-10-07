# Objetivo: Criar um cadastro simples de aluno, armazenar suas informações e exibir os dados cadastrados na tela.


nome = IO.gets("Digite o nome do aluno: ") |> String.trim()
idade = IO.gets("Digite a idade do aluno: ") |> String.trim() |> String.to_integer()
curso = IO.gets("Digite o curso do aluno: ") |> String.trim()
periodo = IO.gets("Digite o período do aluno: ") |> String.trim() |> String.to_integer()

IO.puts("\n Aluno #{nome} cadastrado com sucesso!\n")

IO.puts("=== Cadastro do Aluno ===")
IO.puts("Nome: #{nome}")
IO.puts("Idade: #{idade} anos")
IO.puts("Curso: #{curso}")
IO.puts("Período: #{periodo}º")
