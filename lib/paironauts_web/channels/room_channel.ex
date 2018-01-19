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
    IO.inspect Presence.list(socket)
    {:ok, _} = Presence.track(socket, socket.assigns.user_id, %{
      online_at: inspect(System.system_time(:seconds))
    })
    {:noreply, socket}
  end

  def handle_in(name, %{"pathname" => pathname}, socket) do
    if name == "start_pairing" and pathname == "/pairing" do
      IO.puts 'start_pairing request'
      # 
      if socket |> Presence.list |> Enum.count > 1 do
        broadcast!(socket, "live_response", %{url: "/pairing_room_1"})
      end
    end
    {:noreply, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end
