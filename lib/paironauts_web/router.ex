defmodule PaironautsWeb.Router do
  use PaironautsWeb, :router

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

  pipeline :auth do
    plug PaironautsWeb.Plug.AuthAccessPipeline
  end

  scope "/", PaironautsWeb do
    pipe_through :browser # Use the default browser stack

    get "/pairing_rooms/:room_id", PageController, :pairing_rooms
    get "/pairing", PageController, :pairing
    get "/mob", PageController, :mob
    get "/", PageController, :index
  end

  scope "/api", PaironautsWeb do
    pipe_through :api
    scope "/auth" do
      post "/identity/callback", AuthenticationController, :identity_callback
    end

    pipe_through :auth
    resources "/users", UserController, except: [:new, :edit]
  end
end
