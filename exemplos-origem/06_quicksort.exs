defmodule Quicksort do
  def quicksort([], _ordem), do: []
  def quicksort([unico], _ordem), do: [unico]

  def quicksort([pivot | resto], ordem) when ordem in [:asc, :desc] do
    {menores, maiores} = Enum.split_with(resto, &comparar(&1, pivot, ordem))
    quicksort(menores, ordem) ++ [pivot] ++ quicksort(maiores, ordem)
  end

  defp comparar(a, b, :asc), do: a < b
  defp comparar(a, b, :desc), do: a > b

  def quicksort_paralelo(lista, ordem \\ :asc, concorrencia \\ 4) do
    partes =
      lista
      |> Enum.chunk_every(div(length(lista), concorrencia) + 1)
      |> Task.async_stream(&quicksort(&1, ordem), max_concurrency: concorrencia)
      |> Enum.flat_map(fn {:ok, parte} -> parte end)

    quicksort(partes, ordem)
  end

  def run(lista, ordem \\ :asc) do
    IO.puts("Lista original:   #{inspect(lista)}")
    IO.puts("Quicksort #{ordem}: #{inspect(quicksort(lista, ordem))}")
    IO.puts("Enum.sort (ref): #{inspect(Enum.sort(lista, ordem))}")
  end

  def run_paralelo(lista, ordem) do
    {tempo, resultado} = :timer.tc(fn -> quicksort_paralelo(lista, ordem) end)
    IO.puts("Paralelo #{ordem}: #{length(resultado)} itens em #{div(tempo, 1000)}ms")
    IO.puts("Igual ao sequencial: #{resultado == quicksort(lista, ordem)}")
  end
end

Quicksort.run([5, 2, 9, 1, 7, 2, 8, 3, 9, 4, 1], :asc)
Quicksort.run([5, 2, 9, 1, 7, 2, 8, 3, 9, 4, 1], :desc)

lista_grande = Enum.to_list(1..500) |> Enum.map(&rem(&1 * 7919, 1000))
Quicksort.run_paralelo(lista_grande, :asc)