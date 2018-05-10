defmodule PaironautsWeb.UserView do
  use PaironautsWeb, :view
  alias PaironautsWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      hashed_password: user.hashed_password,
      permissions: user.permissions}
  end
end
