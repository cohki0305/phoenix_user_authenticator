defmodule UserAuthenticator.Router do
  use UserAuthenticator.Web, :router

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

  scope "/", UserAuthenticator do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    scope "/users", Users do
      resources "/registers", RegistrationsController, only: [:new, :create]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", UserAuthenticator do
  #   pipe_through :api
  # end
end
