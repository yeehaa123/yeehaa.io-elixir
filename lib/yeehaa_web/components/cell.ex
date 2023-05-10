defmodule YeehaaWeb.CellComponents do
  use YeehaaWeb, :html

  slot :inner_block
  attr :class, :string, default: nil

  defp base_cell(assigns) do
    ~H"""
    <div class={[
      "grid place-items-center w-full aspect-square rounded-xl transition-all",
      @class
    ]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :cell, :any, required: true

  def cell(assigns) when assigns.cell.direction === :up do
    ~H"""
    <.base_cell class="bg-yellow-300 rotate-6 hover:-rotate-12 hover:bg-yellow-500" />
    """
  end

  def cell(assigns) when assigns.cell.direction === :down do
    ~H"""
    <.base_cell class="bg-pink-300 rotate-6 hover:-rotate-12 hover:bg-pink-500" />
    """
  end

  def cell(assigns) when assigns.cell.direction === :left do
    ~H"""
    <.base_cell class="bg-orange-300 rotate-6 hover:-rotate-12 hover:bg-orange-500" />
    """
  end

  def cell(assigns) when assigns.cell.direction === :right do
    ~H"""
    <.base_cell class="bg-blue-300 rotate-6 hover:-rotate-12 hover:bg-blue-500" />
    """
  end

  def cell(assigns) do
    ~H"""
    <.base_cell class="bg-yellow-100 -rotate-3" />
    """
  end
end
