defmodule Yeehaa.Organism do
  alias Yeehaa.Organism
  defstruct status: false, active_neighbor_count: 0

  def new() do
    %Organism{
      status: random_status()
    }
  end

  def update_status(organism, active_count) do
    %Organism{
      organism
      | status: determine_status(organism.status, active_count),
        active_neighbor_count: active_count
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
    if random_bool(60) do
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
