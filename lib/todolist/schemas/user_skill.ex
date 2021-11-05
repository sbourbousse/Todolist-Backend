defmodule Todolist.Schemas.UserSkill do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "users_skills" do
    field :user, :id, primary_key: true
    field :skill, :id, primary_key: true

    timestamps()
  end

  @doc false
  def changeset(user_skill, attrs) do
    user_skill
    |> cast(attrs, [])
    |> validate_required([])
  end
end
