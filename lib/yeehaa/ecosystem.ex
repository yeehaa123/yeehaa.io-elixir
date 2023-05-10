defmodule Yeehaa.Ecosystem do
  alias Yeehaa.Organism

  def populate(max) do
    Enum.map(1..max, &speculate(&1))
  end

  def update(ecosystem) do
    next_state = update_organisms(ecosystem)

    for {_, index} <- Enum.with_index(ecosystem) do
      find_organism(next_state, index)
    end
  end

  defp speculate(index) do
    random_bool(40) && Organism.new(index)
  end

  defp update_organisms(ecosystem) do
    ecosystem
    |> get_active_organisms()
    |> Enum.map(&move_organism(&1, length(ecosystem)))
  end

  defp get_active_organisms(ecosystem) do
    Enum.filter(ecosystem, & &1)
  end

  defp move_organism(organism, number_of_cells) do
    Organism.move(
      organism,
      rem(organism.index + 1, number_of_cells)
    )
  end

  defp find_organism(organisms, index) do
    Enum.find(organisms, fn o -> index === o.index end)
  end

  defp random_bool(percentage) do
    random_number = :rand.uniform(100)
    random_number < percentage
  end
end
