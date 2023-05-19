defmodule Yeehaa.Ecosystem do
  alias Yeehaa.Organism
  alias Yeehaa.Neighbors

  def initialize(max) do
    1..max
    |> Enum.map(&Organism.new(&1))
    |> add_neighbors()
  end

  def update(ecosystem) do
    ecosystem
    |> Enum.map(&Organism.update_status(&1))
    |> add_neighbors
  end

  defp add_neighbors(ecosystem) do
    for {organism, index} <- Enum.with_index(ecosystem) do
      neighbors = get_neighbors(ecosystem, index)
      Organism.add_neighbors(organism, neighbors)
    end
  end

  defp get_neighbors(ecosystem, index) do
    size = length(ecosystem)
    side = floor(:math.sqrt(size))
    row_start = floor(index / side) * side

    indices = %{
      left: index - 1 >= row_start && index - 1,
      right: index + 1 <= row_start + (side - 1) && index + 1,
      top: index - side >= 0 && index - side,
      bottom: index + side <= size - 1 && index + side
    }

    data =
      for {k, i} <- indices, into: %{} do
        {k, i && Enum.at(ecosystem, i)}
      end

    struct(Neighbors, data)
  end
end
