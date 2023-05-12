defmodule Yeehaa.Ecosystem do
  alias Yeehaa.Organism

  def populate(max) do
    for _index <- 1..max do
      Organism.new()
    end
  end

  def update(ecosystem) do
    for {organism, index} <- Enum.with_index(ecosystem) do
      neighbors = get_neighbors(ecosystem, index)
      active_count = Enum.count(neighbors, &count_neighbor(&1))
      Organism.update_status(organism, active_count)
    end
  end

  defp get_neighbors(ecosystem, index) do
    row_start = floor(index / 10) * 10

    indices = %{
      left: index - 1 >= row_start && index - 1,
      right: index + 1 <= row_start + 9 && index + 1,
      top: index - 10 >= 0 && index - 10,
      bottom: index + 10 <= 99 && index + 10
    }

    for {_k, i} <- indices do
      i && Enum.at(ecosystem, i)
    end
  end

  defp count_neighbor(%{status: status}) when status === :active do
    true
  end

  defp count_neighbor(neighbor) do
    false
  end
end
