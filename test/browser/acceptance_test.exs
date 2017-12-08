defmodule Paironauts.AcceptanceTest do
    use PaironautsWeb.BrowserCase, async: true
  
    import Wallaby.Query 
  


    # Right now it works so I don't really want to break it...
    # Just put that functionality somewhere else.

    # Mob
    # Just dumps people into a Jitsi

    # Scenario: Joining a room with a pair partner
    # Given that I visit the home page
    # Then I should see "waiting for pair partner ..."
    # When another user joins
    # Then I should see "preparing your pair room"
    # And the other user should see the room load
    # And I should see the room should load

    def checkout_session do
      {:ok, session} = Wallaby.start_session
      visit(session, Phoenix.Ecto.SQL.Sandbox.path_for(Allocations.Repo, self()))
      session
    end

    test "when a user chooses 'mob' from the homepage, they are added to a single shared Jitsi", %{session: session} do
      # This is barebones.
      # We should check that users are being added to the Jitsi
      session
      |> visit("/") 
      |> click(css("#mob"))
      |> assert_has(css("#meet"))
    end

    test "when two users choose 'pair' from the homepage, they are added to a Jitsi", %{session: session} do
      session
      |> visit("/")
      |> click(css("#pair"))
      |> assert_has(css("#meet"))

      session_two = checkout_session
      
      session_two
      |> visit("/")
      |> has_text?("Paironauts")
      |> assert
    end  
  end