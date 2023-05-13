defmodule Yeehaa.Ecosystem do
  alias Yeehaa.Organism

  def initialize(max) do
    populate(max)
    |> add_neighbor_count
  end

  def update(ecosystem) do
    ecosystem
    |> update_cell_status
    |> add_neighbor_count
  end

  defp add_neighbor_count(ecosystem) do
    for {organism, index} <- Enum.with_index(ecosystem) do
      neighbors = get_neighbors(ecosystem, index)
      active_count = Enum.count(neighbors, &(&1 && &1.status === :active))
      Organism.add_active_count(organism, active_count)
    end
  end

  defp populate(max) do
    for _index <- 1..max do
      Organism.new()
    end
  end

  defp update_cell_status(ecosystem) do
    for organism <- ecosystem do
      Organism.update_status(organism)
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

    for {_k, i} <- indices do
      i && Enum.at(ecosystem, i)
    end
  end
end
