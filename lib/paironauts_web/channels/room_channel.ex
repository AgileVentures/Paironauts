defmodule PaironautsWeb.RoomChannel do
  @moduledoc """
  The interface between the browser and the Paironaut sever.
  """
  alias PaironautsWeb.Presence
  use Phoenix.Channel

  def join("room:pairing", _message, socket) do
    # if we have a count of open connections to websocket
    # https://hexdocs.pm/phoenix/Phoenix.Presence.html
    # when we have two, we could send js to redirect both to room with
    # specific id ... maybe using https://developer.mozilla.org/en-US/docs/Web/API/Location/replace
   
    # how many clients listening on websocket
    # if >2 then broadcast the pairing redirect

    send(self(), :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    push socket, "presence_state", Presence.list(socket)
    {:ok, _} = Presence.track(socket, socket.assigns.user_id, %{
      online_at: inspect(System.system_time(:seconds))
    })
    {:noreply, socket}
  end

  @doc """
    Handler for start pairing message
  """

  def handle_in("start_pairing", %{"pathname" => "/pairing"}, socket) do
    IO.puts 'start_pairing request'
    IO.inspect Presence.list(socket)
    uuid = Ecto.UUID.generate
    if socket |> Presence.list |> Enum.count > 1 do
      broadcast!(socket, "live_response", %{url: "/pairing_rooms/#{uuid}"})
    end
    {:noreply, socket}
  end

  @doc """
    Default handler for incoming message
  """

  def handle_in(_message, _params, socket) do
    {:noreply, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end
