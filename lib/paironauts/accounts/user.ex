defmodule Paironauts.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :hashed_password, :string
    field :permissions, :map
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :hashed_password, :permissions])
    |> validate_required([:username, :hashed_password, :permissions])
    |> unique_constraint(:username)
  end
end
