defmodule HelloWeb.PageView do
  use HelloWeb, :view 

  def render("index.json", %{pages: pages})
end
