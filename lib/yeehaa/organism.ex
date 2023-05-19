defmodule Yeehaa.Organism do
  alias Yeehaa.Organism
  alias Yeehaa.Neighbors
  defstruct status: false, active_neighbor_count: 0, neighbors: %Neighbors{}

  def new(index \\ %Organism{}) do
    %Organism{
      status: random_status()
    }
  end

  def add_neighbors(organism, neighbors) do
    %Organism{
      organism
      | neighbors: neighbors,
        active_neighbor_count: Neighbors.active_count(neighbors)
    }
  end

  def update_status(organism) do
    %{status: status, active_neighbor_count: count} = organism

    %Organism{
      organism
      | status: determine_status(status, count)
    }
  end

  defp determine_status(status, count) do
    cond do
      count === 3 ->
        :active

      status === :active and count === 2 ->
        :active

      true ->
        :inactive
    end
  end

  defp random_status() do
    if random_bool(75) do
      :active
    else
      :inactive
    end
  end

  defp random_bool(percentage) do
    random_number = :rand.uniform(100)
    random_number < percentage
  end
end
