defmodule Yeehaa.Organism do
  alias Yeehaa.Organism
  defstruct [:status]

  def new() do
    %Organism{
      status: random_status()
    }
  end

  def deactivate(organism) do
    %Organism{organism | status: :inactive}
  end

  def activate(organism) do
    %Organism{organism | status: :active}
  end

  defp random_status() do
    if random_bool(4) do
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
