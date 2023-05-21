defmodule YeehaaWeb.GameOfLifeLive do
  use YeehaaWeb, :live_view
  import YeehaaWeb.GridComponents
  import YeehaaWeb.CellComponents
  import YeehaaWeb.HomepageHelperComponents
  alias Yeehaa.Ecosystem

  def mount(_params, _session, socket) do
    grid = Ecosystem.initialize(100)

    if connected?(socket) do
      :timer.send_interval(5000, self(), :tick)
    end

    {:ok, assign(socket, grid: grid)}
  end

  def render(assigns) do
    ~H"""
    <div class="text-white text-center font-black text-6xl">
      <.inner_section class="py-48 text-white sm:text-4xl text-6xl">
        <h1>Innovation does not begin</h1>
        <h1 class="mb-24">with radical, structural transformation</h1>
        <h1>It starts with barely perceptible shifts</h1>
      </.inner_section>
      <.outer_section>
        <.inner_section class="py-48">
          <h1 class="text-8xl">THIS IS YEEHAA</h1>
          <h2 class="text-6xl">Creating the sound that brings harmony to dissonant structures</h2>
          <h1 class="text-4xl">By doing</h1>
          <div class="flex justify-between text-4xl">
            <p>THIS</p>
            <p>THIS</p>
            <p>THIS</p>
          </div>
        </.inner_section>
      </.outer_section>
      <div class="bg-sun">
        <.outer_section class="bg-fire text-dark">
          <.inner_section class="py-48">
            <h1 class="text-6xl">WITHOUT ONGOING ALIGNMENT ALL CLOSED SYSTEMS FALL INTO ENTROPY</h1>
          </.inner_section>
        </.outer_section>
      </div>
      <div class="bg-fire">
        <.outer_section class="bg-purp text-white">
          <.inner_section class="py-48">
            <h1 class="text-6xl">Our solutions are based on</h1>
            <div class="flex justify-between text-4xl">
              <p>THIS</p>
              <p>THIS</p>
              <p>THIS</p>
            </div>
          </.inner_section>
        </.outer_section>
      </div>
      <div class="bg-purp">
        <.outer_section>
          <.inner_section class="py-48">
            <h1 class="text-6xl">THE PROOF IS IN THE PUDDING</h1>
            <div class="flex justify-between text-4xl">
              <p>Case + Testimonial</p>
              <p>Case + Testimonial</p>
              <p>Case + Testimonial</p>
            </div>
          </.inner_section>
        </.outer_section>
      </div>
      <div class="bg-sun">
        <.outer_section class="bg-curtains text-white">
          <.inner_section>
            <h1 class="text-6xl">Contact Info</h1>
            <.grid class="hidden">
              <.cell :for={organism <- @grid} cell={organism} />
            </.grid>
          </.inner_section>
        </.outer_section>
      </div>
    </div>
    """
  end

  def handle_info(:tick, socket) do
    grid = Ecosystem.update(socket.assigns.grid)

    {:noreply,
     socket
     |> assign(grid: grid)}
  end
end
