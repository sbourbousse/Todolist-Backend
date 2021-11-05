defmodule Todolist.Repo.Migrations.CreateUsersSkills do
  use Ecto.Migration

  def change do
    create table(:users_skills, primary_key: false) do
      add :user, references(:users, on_delete: :nothing), primary_key: true
      add :skill, references(:skills, on_delete: :nothing), primary_key: true

      timestamps()
    end

    create index(:users_skills, [:user])
    create index(:users_skills, [:skill])
  end
end
