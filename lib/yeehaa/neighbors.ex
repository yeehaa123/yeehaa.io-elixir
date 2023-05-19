defmodule Yeehaa.Neighbors do
  defstruct [:left, :right, :top, :bottom]

  def active_count(neighbors) do
    neighbors
    |> Map.from_struct()
    |> Map.values()
    |> Enum.filter(& &1)
    |> Enum.count(&(&1.status === :active))
  end
end
