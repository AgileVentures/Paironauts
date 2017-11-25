defmodule Paironauts.AcceptanceTest do
    use PaironautsWeb.BrowserCase, async: true
  
    import Wallaby.Query, only: [css: 2]
  
    test "users have names", %{session: session} do
      session
      |> visit("/")
      |> assert_has(css(".user-name", text: "Chris"))
    end
  end