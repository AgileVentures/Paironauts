defmodule PaironautsWeb.Presence do  
  use Phoenix.Presence, otp_app: :paironauts,
                        pubsub_server: Paironauts.PubSub
end 