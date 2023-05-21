defmodule YeehaaWeb.HomepageHelperComponents do
  use YeehaaWeb, :html

  attr(:class, :string, default: nil)
  slot :inner_block

  def heading(assigns) do
    ~H"""
    <h1 class={["text-4xl md:text-5xl lg:text-6xl 2xl:text-8xl -z-10", @class]}>
      <%= render_slot(@inner_block) %>
    </h1>
    """
  end

  attr(:shape, :integer, default: 1)
  slot :inner_block

  def blob(assigns) when assigns.shape === 1 do
    ~H"""
    <div>
      <svg viewBox="0 0 1728 440" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g clip-path="url(#clip0_130_65)">
          <path
            d="M-1 440H1728C1728 440 1581.64 396.56 1319.47 218.322C1210.49 144.224 1108.41 0 839.742 0C544.523 0 427.109 178.019 329.818 251.91C232.528 325.801 -1 440 -1 440Z"
            fill="#F9A505"
          />
        </g>
      </svg>
      <.outer_section class="bg-sun text-curtains">
        <.inner_section class="max-w-4xl">
          <%= render_slot(@inner_block) %>
        </.inner_section>
      </.outer_section>
      <svg class="bg-fire" viewBox="0 0 1727 427" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g clip-path="url(#clip0_130_95)">
          <path
            d="M1727 -20V89.2202C1727 92.573 1726.95 95.9131 1726.84 99.2405C1721.55 270.106 1581.24 407 1408.94 407C1288.36 407 1183.44 339.957 1129.51 241.138C1075.59 339.957 970.672 407 850.086 407C729.499 407 622.514 338.617 569.075 238.191C515.63 338.617 409.833 407 288.058 407C112.399 407 -30 264.722 -30 89.2202C-30 84.6862 -29.9047 80.1714 -29.714 75.6819V-20H1727Z"
            fill="#F9A505"
          />
        </g>
      </svg>
    </div>
    """
  end

  def blob(assigns) when assigns.shape === 2 do
    ~H"""
    <div class="w-full">
      <.outer_section class="bg-fire text-dark">
        <.inner_section class="max-w-2xl lg:max-w-4xl">
          <%= render_slot(@inner_block) %>
        </.inner_section>
      </.outer_section>
      <svg class="bg-purp" viewBox="0 0 1728 258" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g clip-path="url(#clip0_130_98)">
          <path
            class="fill-fire"
            d="M1728 0V257.9C1519.41 123.054 1209.32 37.5737 863.078 37.5737C516.84 37.5737 206.595 123.098 -2 258V0H1728Z"
          />
        </g>
      </svg>
    </div>
    """
  end

  attr(:class, :string, default: nil)
  slot :inner_block

  def outer_section(assigns) do
    ~H"""
    <section class={["min-h-full", @class]}>
      <%= render_slot(@inner_block) %>
    </section>
    """
  end

  attr(:class, :string, default: nil)
  slot :inner_block

  def inner_section(assigns) do
    ~H"""
    <div class={["max-w-6xl m-auto font-black p-8 text-center", @class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
