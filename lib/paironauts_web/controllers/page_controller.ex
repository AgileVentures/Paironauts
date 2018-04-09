defmodule PaironautsWeb.PageController do
  use PaironautsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def pairing(conn, _params) do
    render conn, "pairing.html"
  end

  def pairing_rooms(conn, _params) do
    render conn, "pairing_room.html"
  end

  def mob(conn, _params) do
    render conn, "mob.html"
  end

  def ssl(conn, %{"key" => key}) do
    text conn, "#{key}.9tmfKoRwoUJvAUfJMFgbHSW9b226ODrWnsfOEjMkm1A"
  end
end
