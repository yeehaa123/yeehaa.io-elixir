defmodule YeehaaWeb.GridComponents do
  use YeehaaWeb, :html

  attr :cell, :any, required: true

  def cell(assigns) do
    assigns = assign(assigns, :color, "yellow")

    ~H"""
    <div class={[
      "grid place-items-center w-full aspect-square rounded-xl transition-all font-raleway",
      if @cell.active do
        "bg-yellow-300 text-yellow-100 rotate-6 hover:-rotate-12 hover:bg-yellow-500 hover:text-white"
      else
        "bg-yellow-100 text-yellow-300 -rotate-3"
      end
    ]}>
      <%= @cell.index %>
    </div>
    """
  end

  attr :cells, :list, required: true

  def grid(assigns) do
    assigns =
      assigns
      |> assign(:number_of_cells, length(assigns.cells))
      |> assign(:size, floor(:math.sqrt(length(assigns.cells))))

    ~H"""
    <div class="grid grid-cols-10 gap-1">
      <.cell :for={cell <- @cells} cell={cell} />
    </div>
    """
  end
end
