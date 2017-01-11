defmodule YourApp.Router do
  use YourApp.Web, :router

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

  scope "/", YourApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/", YourApp do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController
  end

  scope "/", YourApp do
    pipe_through :browser # Use the default browser stack

    resources "/users/new", UserController
  end

  

  

  # Other scopes may use custom stacks.
  # scope "/api", YourApp do
  #   pipe_through :api
  # end
end
