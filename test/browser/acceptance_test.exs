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
      |> find(css("#pairing_session"))
      |> has_text?("Waiting for pair partner")
      |> refute

      session1
      |> has_text?("Pairing session")
      |> assert

      # check redirected to /pairing-2345678 /pairing/2345678
      # check 
      # |> has_text?("Paironauts") 
      # |> assert

      # session1
      # # check redirected to /pairing-2345678
      # |> assert

    end  
    
    # ensure only two users arrive in pairing session (and both of them were waiting to pair)
    # 1. don't drag users off other pages
    # 2. don't drag users out of existing pairing sessions 

    test "user on home page who hasn't chosen to pair is not pulled into pairing session", %{session: first_user_wanting_to_pair} do
      first_user_wanting_to_pair
      |> visit("/")
      |> click(css("#pair")) 
      |> has_text?("Waiting for pair partner")
      |> assert

      # user on home page (also need to check for user in pairing session, and third user waiting)
      {:ok, user_not_wanting_to_pair} = Wallaby.start_session
      user_not_wanting_to_pair
      |> visit("/")
      |> has_text?("Waiting for pair partner")
      |> refute

      {:ok, second_user_wanting_to_pair} = Wallaby.start_session
      second_user_wanting_to_pair
      |> visit("/")
      |> click(css("#pair"))
      |> find(css("#pairing_session"))
      |> has_text?("Waiting for pair partner")
      |> refute

      user_not_wanting_to_pair
      |> has_text?("Pairing session")
      |> refute
    
    end     
    # ensure that a third user somewhere on the site is not dragged into the pairing room
    test '...'
    test '...'
    # both if on homepage and even if on the pairing waiting room, or in other pairing 

  end