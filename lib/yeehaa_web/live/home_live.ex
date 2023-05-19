defmodule YeehaaWeb.HomeLive do
  use YeehaaWeb, :live_view
  import YeehaaWeb.GridComponents
  import YeehaaWeb.CellComponents
  alias Yeehaa.Ecosystem

  def mount(_params, _session, socket) do
    grid = Ecosystem.initialize(100)

    if connected?(socket) do
      :timer.send_interval(500, self(), :tick)
    end

    {:ok, assign(socket, grid: grid)}
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-8xl m-auto text-white container text-center bg-fixed h-1/2 font-black text-6xl py-48">
      <h1> Innovation does not begin</h1>
      <h1 class="mb-24">with radical, structural transformation</h1>
      <h1>It starts with barely perceptible shifts</h1>
    </div>
    <div class="sticky top-0 bg-sun text-curtains font-black py-32">
      <div class="max-w-4xl m-auto grid gap-y-32 text-center">
        <h1 class="text-8xl">THIS IS YEEHAA</h1>
        <h2 class="text-6xl">Creating the sound that brings harmony to dissonant structures</h2>
        <h1 class="text-4xl">By doing</h1>
        <div class="flex justify-between text-4xl">
            <p>THIS</p>
            <p>THIS</p>
            <p>THIS</p>
        </div>
      </div>
    </div>
    <div class="sticky top-0 bg-fire text-dark font-black py-32">
      <div class="max-w-4xl m-auto grid gap-y-32 text-center">
        <h1 class="text-6xl">WITHOUT ONGOING ALIGNMENT ALL CLOSED SYSTEMS FALL INTO ENTROPY</h1>
      </div>
    </div>
    <div class="sticky top-0 bg-purp text-white font-black py-32">
      <div class="max-w-4xl m-auto grid gap-y-32 text-center">
        <h1 class="text-4xl">Our solutions are based on</h1>
        <div class="flex justify-between text-4xl">
            <p>THIS</p>
            <p>THIS</p>
            <p>THIS</p>
        </div>
      </div>
    </div>
    <div class="sticky top-0 bg-sun text-curtains font-black py-32">
      <div class="max-w-4xl m-auto grid gap-y-32 text-center">
        <h1 class="text-6xl">THE PROOF IS IN THE PUDDING</h1>
        <div class="flex justify-between text-4xl">
            <p>Case + Testimonial</p>
            <p>Case + Testimonial</p>
            <p>Case + Testimonial</p>
        </div>
      </div>
    </div>
    <div class="sticky bg-curtains text-white font-black py-32">
      <div class="max-w-4xl m-auto grid gap-y-32 text-center">
        <h1 class="text-6xl">Contact Info</h1>
    </div>
    </div>
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
