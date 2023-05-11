defmodule Yeehaa.Ecosystem do
  alias Yeehaa.Organism

  def populate(max) do
    for _index <- 1..max do
      Organism.new()
    end
  end

  def update(ecosystem) do
    ecosystem_with_index = Enum.with_index(ecosystem)

    for {organism, index} <- ecosystem_with_index do
      neighbors = get_neighbors(ecosystem_with_index, index)

      statuses =
        for {_k, v} <- neighbors do
          v.status
        end

      active_count = Enum.count(statuses, &(&1 === :active))

      if organism.status === :active && (active_count == 3 or active_count == 2) do
        Organism.activate(organism)
      else
        if organism.status === :inactive && active_count == 3 do
          Organism.activate(organism)
        else
          Organism.deactivate(organism)
        end
      end
    end
  end

  defp get_neighbors(ecosystem_with_index, index) do
    {left_neighbor, _} = Enum.at(ecosystem_with_index, index - 1)
    {right_neighbor, _} = Enum.at(ecosystem_with_index, rem(index + 1, 100))
    {top_neighbor, _} = Enum.at(ecosystem_with_index, index - 10)
    {bottom_neighbor, _} = Enum.at(ecosystem_with_index, rem(index + 10, 100))

    %{
      left: left_neighbor,
      right: right_neighbor,
      top: top_neighbor,
      bottom: bottom_neighbor
    }
  end
end
