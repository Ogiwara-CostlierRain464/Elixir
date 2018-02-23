defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/test", PageController, :test
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete],
                                             singleton: true 
  end

  # Other scopes may use custom stacks.
  #scope "/api", HelloWeb do
  #  pipe_through :api
  #  
  #  resources "/reviews", ReviewController
  #end

  scope "/cms", HelloWeb.CMS, as: :cms do
    pipe_through [:browser, :authenticate_user]

    resources "/pages", PageController
  end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login reqired")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->  
        assign(conn, :current_user, Hello.Accounts.get_user!(user_id))
    end  
  end
end