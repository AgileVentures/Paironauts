defmodule Paironauts.Repo.Migrations.CreateCoherenceUser do
  use Ecto.Migration
  def change do
    create table(:users) do

      add :name, :string
      add :email, :string
      # authenticatable
      add :password_hash, :string
      
      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
