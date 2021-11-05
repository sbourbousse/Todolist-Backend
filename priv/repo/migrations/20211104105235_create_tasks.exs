defmodule Todolist.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :status, :integer
      add :user, references(:users, on_delete: :nothing)
      add :skill, references(:skills, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:user])
    create index(:tasks, [:skill])
  end
end
