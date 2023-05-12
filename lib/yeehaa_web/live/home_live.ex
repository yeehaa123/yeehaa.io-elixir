defmodule YeehaaWeb.HomeLive do
  use YeehaaWeb, :live_view
  import YeehaaWeb.GridComponents
  import YeehaaWeb.CellComponents
  alias Yeehaa.Ecosystem

  def mount(_params, _session, socket) do
    grid = Ecosystem.populate(100)

    if connected?(socket) do
      :timer.send_interval(3000, self(), :tick)
    end

    {:ok, assign(socket, grid: grid)}
  end

  def render(assigns) do
    ~H"""
    <.grid>
      <.cell :for={organism <- @grid} cell={organism} />
    </.grid>
    """
  end

  def handle_info(:tick, socket) do
    grid = Ecosystem.update(socket.assigns.grid)

    {:noreply,
     socket
     |> assign(grid: grid)}
  end
end
