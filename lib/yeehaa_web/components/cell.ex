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

  def cell(assigns) when assigns.cell.status === :inactive do
    ~H"""
    <.base_cell class="bg-yellow-100 -rotate-3" />
    """
  end

  def cell(assigns) when assigns.cell.status === :active do
    ~H"""
    <.base_cell class="bg-yellow-300 rotate-6 hover:-rotate-12 hover:bg-yellow-500" />
    """
  end
end
