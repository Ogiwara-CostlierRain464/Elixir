defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def show(conn, _params) do
    page = %{title: "foo"}

    render conn, "show.json", page: page
  end

  def index(conn, _params) do
    render conn, "index.html"
    #pages = [%{title: "foo"},%{title: "bar"}]

    #render conn, "index.json" , pages: pages
  end

  def test(conn, _params) do
    render conn, "test.html"
  end  
end
