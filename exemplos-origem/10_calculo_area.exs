defmodule Geometria do
  def area_triangulo(base, altura) do
    (base * altura) / 2
  end
  
  def area_quadrado(lado) do
  lado * lado
  end
end

base_triangulo = 10
altura_triangulo = 5
area_t = Geometria.area_triangulo(base_triangulo, altura_triangulo)

IO.puts("A área do triângulo (base #{base_triangulo}, altura #{altura_triangulo}) é: #{area_t}")
IO.puts("A área do quadrado de lado 4 é: #{Geometria.area_quadrado(4)}")