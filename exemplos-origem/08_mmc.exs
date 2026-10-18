defmodule MMC do
  def mmc(a, b) when a == 0 or b == 0, do: 0
  def mmc(a, b), do: div(abs(a * b), mdc(a, b))

  def mdc(a, 0), do: abs(a)
  def mdc(a, b), do: mdc(b, rem(a, b))

  def iniciar_cache do
    :ets.new(:mmc_cache, [:named_table, :public, :set])
  end

  def mmc_cache(a, b) do
    chave = {a, b}

    case :ets.lookup(:mmc_cache, chave) do
      [{^chave, valor}] ->
        {:cache, valor}

      [] ->
        valor = mmc(a, b)
        :ets.insert(:mmc_cache, {chave, valor})
        {:calculado, valor}
    end
  end

  def pares(lista) do
    for a <- lista, b <- lista, a < b, do: {a, b}
  end

  def mmc_paralelo(pares) do
    pares
    |> Task.async_stream(fn {a, b} -> mmc_cache(a, b) end, max_concurrency: 4)
    |> Enum.map(fn
      {:ok, {:cache, valor}} -> {:cache, valor}
      {:ok, {:calculado, valor}} -> {:calculado, valor}
    end)
    |> Enum.frequencies()
  end

  def run do
    IO.puts("MMC(12, 18) = #{mmc(12, 18)}")
    IO.puts("MMC(4, 6)   = #{mmc(4, 6)}")
    IO.puts("MMC(5, 7)   = #{mmc(5, 7)}")
    IO.puts("MMC(0, 9)   = #{mmc(0, 9)}")

    iniciar_cache()
    IO.inspect(mmc_cache(12, 18), label: "1a chamada")
    IO.inspect(mmc_cache(12, 18), label: "2a chamada")

    resultado = pares([4, 6, 8, 9]) |> mmc_paralelo()
    IO.inspect(resultado, label: "Calculados x vindos do cache")
  end
end

MMC.run()