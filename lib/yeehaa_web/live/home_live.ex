defmodule YeehaaWeb.HomeLive do
  use YeehaaWeb, :live_view
  import YeehaaWeb.GridComponents
  require Integer

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(100, self(), :tick)
    end

    cells = populate(100)

    {:ok,
     socket
     |> assign(:cells, cells)}
  end

  def render(assigns) do
    ~H"""
    <.grid cells={@cells} />
    """
  end

  defp populate(max) do
    1..max
    |> Enum.map(fn n ->
      %{
        index: n,
        active: random_bool(40),
        direction: "up"
      }
    end)
  end

  defp random_bool(percentage) do
    random_number = :rand.uniform(100)
    random_number < percentage
  end

  def handle_info(:tick, socket) do
    {:noreply, socket}
  end
end
