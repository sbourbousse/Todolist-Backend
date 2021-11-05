defmodule Todolist.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :lastname, :string
      add :firstname, :string
      add :email, :string
      add :password, :string
      add :role, :integer

      timestamps()
    end
  end
end
