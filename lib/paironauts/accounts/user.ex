defmodule Paironauts.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Paironauts.Accounts.User

  schema "users" do
    field :hashed_password, :string
    field :permissions, :map
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
    |> put_hashed_password()
  end
  end
end
