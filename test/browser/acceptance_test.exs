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

    test "when a user chooses 'mob' from the homepage, they are added to a single shared Jitsi", %{session: session} do
      # This is barebones.
      # We should check that users are being added to the Jitsi
      session
      |> visit("/") 
      |> click(css("#mob"))
      |> assert_has(css("#meet"))
    end

    # third user should not be added to the same jitsi
    test "when two users choose 'pair' from the homepage, they are added to a Jitsi", %{session: session1} do
      session1
      |> visit("/")
      |> click(css("#pair")) 
      |> has_text?("Waiting for pair partner")
      |> assert

      # will see "waiting for pair"
      # and jitsi visible
      # |> assert_has(css("#meet"))  # checking for the meet div

      {:ok, session2} = Wallaby.start_session
      session2
      |> visit("/")
      |> click(css("#pair"))
      |> has_text?("Waiting for pair partner")
      |> refute

      session1
      |> has_text?("Pairing session")

      # check redirected to /pairing-2345678
      # check 
      # |> has_text?("Paironauts") 
      # |> assert

      # session1
      # # check redirected to /pairing-2345678
      # |> assert

    end  
  end