defmodule Crivo do
  def crivo(n) when n < 2, do: []

  def crivo(n) when is_integer(n) and n > 0 do
    limite = trunc(:math.sqrt(n))
    marcar(2, limite, n, MapSet.new(), [])
  end

  def crivo(_n), do: {:error, :n_deve_ser_inteiro_positivo}

  defp marcar(p, limite, n, marcados, primos) when p > limite do
    restantes = Enum.reject(2..n, &MapSet.member?(marcados, &1))
    Enum.uniq(primos ++ restantes) |> Enum.sort()
  end

  defp marcar(p, limite, n, marcados, primos) do
    if MapSet.member?(marcados, p) do
      marcar(p + 1, limite, n, marcados, primos)
    else
      novos = marcar_multiplos(p * p, p, n, marcados)
      marcar(p + 1, limite, n, novos, [p | primos])
    end
  end

  defp marcar_multiplos(i, _p, n, marcados) when i > n, do: marcados

  defp marcar_multiplos(i, p, n, marcados) do
    marcar_multiplos(i + p, p, n, MapSet.put(marcados, i))
  end

  def crivo_intervalo(inicio, fim) do
    tamanho = div(fim - inicio, 4) + 1

    inicio..fim
    |> Enum.chunk_every(tamanho)
    |> Task.async_stream(
      fn [ini | _] = segmento ->
        limite = List.last(segmento)
        case crivo(limite) do
          primos when is_list(primos) -> Enum.filter(primos, &(&1 >= ini))
          {:error, motivo} -> raise ArgumentError, inspect(motivo)
        end
      end,
      max_concurrency: 4,
      ordered: false
    )
    |> Enum.flat_map(fn
      {:ok, lista} -> [lista]
      {:exit, motivo} -> IO.puts("falhou: #{inspect(motivo)}") && []
    end)
    |> List.flatten()
    |> Enum.sort()
  end

  def run(n) do
    IO.puts("Primos ate #{n}: #{inspect(crivo(n))}")
  end

  def run_intervalo(inicio, fim) do
    IO.puts("Primos de #{inicio} a #{fim}: #{inspect(crivo_intervalo(inicio, fim), charlists: :as_lists)}")
  end
end

Crivo.run(50)
Crivo.run_intervalo(50, 120)