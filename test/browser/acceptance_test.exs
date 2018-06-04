defmodule Paironauts.AcceptanceTest do
    use ExUnit.Case
    use Hound.Helpers

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
    hound_session()

    test "when a user chooses 'mob' from the homepage, they are added to a single shared Jitsi", _meta do
      # This is barebones.
      # We should check that users are being added to the Jitsi
      navigate_to("/")
      element = find_element(:id, "mob")
      click(element)

      find_element(:id, "meet")
      |> assert
    end

    # third user should not be added to the same jitsi
    test "when two users choose 'pair' from the homepage, they are added to a Jitsi", _meta do
      in_browser_session"session1", fn ->
        navigate_to("/")
        element = find_element(:id, "pair")
        click(element)
        parent_element = find_element(:tag, "main")
        find_within_element(parent_element, :id, "wait")
        |> visible_text()
        |> Kernel.=~("Waiting for pair partner...")
        |> assert
      end

      in_browser_session "session2", fn ->
        navigate_to("/")
        element = find_element(:id, "pair")
        click(element)

        refute text_visible?({:css, "main"}, "Waiting for pair partner...", 12)
      end

      change_session_to("session1")

      find_element(:tag, "main")
      |> visible_text
      |> Kernel.=~("Pairing session")
      |> assert

      # check redirected to /pairing-2345678 /pairing/2345678
      # check
      # |> has_text?("Paironauts")
      # |> assert

      # session1
      # # check redirected to /pairing-2345678
      # |> assert

    end
    #
    # ensure only two users arrive in pairing session (and both of them were waiting to pair)
    # 1. don't drag users off other pages
    # 2. don't drag users out of existing pairing sessions
    #
    test "user on home page who hasn't chosen to pair is not pulled into pairing session", _meta do
      in_browser_session"first_user_wanting_to_pair", fn ->
        navigate_to("/")
        element = find_element(:id, "pair")
        click(element)

        assert(visible_text({:tag, "main"}) =~ "Waiting for pair partner")
      end

      # user on home page (also need to check for user in pairing session, and third user waiting)
      in_browser_session"user_not_wanting_to_pair", fn ->
        navigate_to("/")

        assert(find_element(:id, "pair"))
      end

      in_browser_session"second_user_wanting_to_pair", fn ->
        navigate_to("/")
        element = find_element(:id, "pair")
        click(element)


        # element = find_element(:tag, "main")
        assert text_visible?({:css, "main"}, "Pairing session", 12)
      end

      change_session_to("first_user_wanting_to_pair")
      assert(visible_text({:tag, "main"}) =~ "Pairing session")

      change_session_to("user_not_wanting_to_pair")
      assert(find_element(:id, "pair"))
    end
    # ensure that a third user somewhere on the site is not dragged into the pairing room
    # test '...'
    # test '...'
    # both if on homepage and even if on the pairing waiting room, or in other pairing
    # Will automatically retry looking for asynchronous text change
    defp text_visible?(element, pattern, retries \\ 5)

    defp text_visible?(element, pattern, 0) do
      visible_in_element?(element, pattern)
    end

    defp text_visible?(element, pattern, retries) do
      case visible_in_element?(element, pattern) do
        true -> true

        false ->
          :timer.sleep(10)
          text_visible?(element, pattern, retries - 1)
      end
    end
  end


