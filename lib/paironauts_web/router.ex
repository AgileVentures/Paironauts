defmodule PaironautsWeb.Router do
  use PaironautsWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PaironautsWeb do
    pipe_through :browser # Use the default browser stack

    get "/pairing_rooms/:room_id", PageController, :pairing_rooms
    get "/pairing", PageController, :pairing
    get "/mob", PageController, :mob
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PaironautsWeb do
  #   pipe_through :api
  # end
end
