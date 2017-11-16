defmodule PaironautsWeb.RoomChannel do
  @moduledoc """
  The interface between the browser and the Paironaut sever.
  """

  use Phoenix.Channel

  def join("room:pairing", _message, socket) do
    # if we have a count of open connections to websocket
    # https://hexdocs.pm/phoenix/Phoenix.Presence.html
    # when we have two, we could send js to redirect both to room with
    # specific id ... maybe using https://developer.mozilla.org/en-US/docs/Web/API/Location/replace
    {:ok, socket}
  end

  def handle_in(name, %{"body" => content}, socket) do
    broadcast!(socket, "live_response", %{url: "/pairing"})
    {:noreply, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end
