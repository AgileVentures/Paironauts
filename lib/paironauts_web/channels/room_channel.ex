defmodule PaironautsWeb.RoomChannel do
  @moduledoc """
  The interface between the browser and the Paironaut sever.
  """
  alias Paironauts.LobbyPresence
  use Phoenix.Channel

  def join("room:pairing", _message, socket) do
    # if we have a count of open connections to websocket
    # https://hexdocs.pm/phoenix/Phoenix.Presence.html
    # when we have two, we could send js to redirect both to room with
    # specific id ... maybe using https://developer.mozilla.org/en-US/docs/Web/API/Location/replace
   
    # how many clients listening on websocket
    # if >2 then broadcast the pairing redirect


    send(self(), :after_join)
    # {:ok, assign(socket, :user_id, ...)}
    {:ok, socket}
  end

  # def handle_info(:after_join, socket) do
  #   push socket, "presence_state", LobbyPresence.list(socket)
  #   {:ok, _} = LobbyPresence.track(socket, socket.assigns.user_id, %{
  #     online_at: inspect(System.system_time(:seconds))
  #   })
  #   {:noreply, socket}
  # end

  def handle_in(name, %{"pathname" => pathname}, socket) do
    if name == "start_pairing" and pathname == "/" do
      broadcast!(socket, "live_response", %{url: "/pairing"})
    end
    {:noreply, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end
