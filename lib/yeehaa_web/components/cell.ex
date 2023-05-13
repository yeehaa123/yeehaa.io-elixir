defmodule YeehaaWeb.CellComponents do
  use YeehaaWeb, :html

  attr(:class, :string, default: nil)
  attr(:cell, :any, required: true)

  defp base_cell(assigns) do
    ~H"""
    <div class={[
      "grid place-items-center w-full aspect-square rounded-xl transition-all",
      @class
    ]}/>
    """
  end

  attr(:cell, :any, required: true)

  def cell(assigns) when assigns.cell.status === :inactive do
    case assigns.cell.active_neighbor_count do
      3 ->
        ~H"""
        <.base_cell cell={@cell} class="white -rotate-3" />
        """

      _ ->
        ~H"""
        <.base_cell cell={@cell} class="bg-yellow-100 -rotate-3" />
        """
    end
  end

  def cell(assigns) when assigns.cell.status === :active do
    case assigns.cell.active_neighbor_count do
      0 ->
        ~H"""
        <.base_cell cell={@cell} class="bg-yellow-200 rotate-6 hover:-rotate-12 hover:bg-yellow-500" />
        """

      1 ->
        ~H"""
        <.base_cell cell={@cell} class="bg-yellow-300 rotate-6 hover:-rotate-12 hover:bg-yellow-500" />
        """

      2 ->
        ~H"""
        <.base_cell cell={@cell} class="bg-yellow-400 rotate-6 hover:-rotate-12 hover:bg-yellow-500" />
        """

      3 ->
        ~H"""
        <.base_cell cell={@cell} class="bg-yellow-500 rotate-6 hover:-rotate-12 hover:bg-yellow-500" />
        """

      4 ->
        ~H"""
        <.base_cell cell={@cell} class="bg-yellow-600 rotate-6 hover:-rotate-12 hover:bg-yellow-500" />
        """
    end
  end
end
