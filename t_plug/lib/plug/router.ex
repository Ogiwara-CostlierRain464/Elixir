defmodule TPlug.Plug.Router do
  use Plug.Router
  #Don't forgent for __using__ 

  plug(:match)
  plug(:dispatch)

  get("/",do: send_resp(conn, 200, "Welcome"))
  match(_, do: send_resp(conn, 404, "Oops!"))
end  
