defmodule HelloWorldPlug do
  import Plug.Conn

  @locals ["ja"]

  def init(options), do: options

  def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) do #when loc in @locals do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World!")
  end 
end 
