defmodule YeehaaWeb.HomeLive do
  use YeehaaWeb, :live_view
  import YeehaaWeb.GridComponents
  import YeehaaWeb.CellComponents
  alias Yeehaa.Ecosystem

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(300, self(), :tick)
    end

    {:ok, assign(socket, grid: Ecosystem.populate(100))}
  end

  def render(assigns) do
    ~H"""
    <.grid>
      <.cell :for={organism <- @grid} cell={organism} />
    </.grid>
    """
  end

  def handle_info(:tick, socket) do
    {:noreply,
     socket
     |> assign(grid: Ecosystem.update(socket.assigns.grid))}
  end
end
