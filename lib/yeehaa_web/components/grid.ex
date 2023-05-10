defmodule YeehaaWeb.GridComponents do
  use YeehaaWeb, :html
  attr :class, :string, default: nil
  slot :inner_block

  def grid(assigns) do
    ~H"""
    <div class={["grid grid-cols-10 gap-1", @class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
