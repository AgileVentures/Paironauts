defmodule Paironauts.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Paironauts.Accounts.User

  schema "users" do
    field :hashed_password, :string
    field :username, :string
    field :password, :string, virtual: true # Virtual password field to hold plain text passwords.
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

  defp put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :hashed_password, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
