defmodule HelloWeb.PageViewTest do
  use HelloWeb.ConnCase, async: true
  use HelloWeb.Router.Helpers

  test "page path" do
    assert(user_path(HelloWeb.Endpoint, :index),"/users")
  end
end
