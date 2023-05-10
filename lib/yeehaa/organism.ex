defmodule Yeehaa.Organism do
  alias Yeehaa.Organism
  defstruct [:index, :direction]

  def new(index) do
    %Organism{
      index: index,
      direction: determine_direction()
    }
  end

  def move(organism, new_index) do
    %Organism{organism | index: new_index}
  end

  def determine_direction() do
    directions = [:up, :down, :left, :right]
    Enum.random(directions)
  end
end
