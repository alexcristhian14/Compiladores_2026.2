defmodule MDC do
  def mdc(a, 0), do: abs(a)
  def mdc(a, b), do: mdc(b, rem(a, b))

  def calcular(a, b) when is_integer(a) and is_integer(b) do
    {:ok, mdc(a, b)}
  end

  def calcular(_a, _b), do: {:error, :argumentos_precisam_ser_inteiros}

  def calcular_seguuro(a, b) do
    try do
      mdc(a, b)
    rescue
      ArithmeticError -> {:error, :erro_de_aritmetica}
    after
      :erlang.garbage_collect()
    end
  end

  def mdc_lista([]), do: {:error, :lista_vazia}

  def mdc_lista(numeros) when is_list(numeros) do
    with :ok <- validar(numeros) do
      [primeiro | resto] = numeros
      {:ok, Enum.reduce(resto, primeiro, &mdc(&2, &1))}
    end
  end

  defp validar(numeros) do
    if Enum.all?(numeros, &is_integer/1), do: :ok, else: {:error, :apenas_inteiros}
  end

  def run do
    IO.puts("MDC(12, 18)  = #{mdc(12, 18)}")
    IO.puts("MDC(48, 180) = #{mdc(48, 180)}")
    IO.puts("MDC(7, 13)   = #{mdc(7, 13)}")
    IO.puts("MDC(0, 9)    = #{mdc(0, 9)}")
    IO.inspect(calcular(12, 18), label: "calcular(12, 18)")
    IO.inspect(calcular(12, "18"), label: "calcular(12, '18')")
    IO.inspect(calcular_seguuro(48, 180), label: "calcular_seguuro(48, 180)")
    IO.inspect(mdc_lista([12, 18, 24]), label: "mdc_lista([12, 18, 24])")
    IO.inspect(mdc_lista([12, "18"]), label: "mdc_lista([12, '18'])")
    IO.inspect(mdc_lista([]), label: "mdc_lista([])")
  end
end

MDC.run()