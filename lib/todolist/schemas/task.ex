defmodule Todolist.Schemas.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :name, :string
    field :status, :integer
    field :user, :id
    field :skill, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :status])
    |> validate_required([:name, :status])
  end
end
