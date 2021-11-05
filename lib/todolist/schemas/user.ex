defmodule Todolist.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :password, :string
    field :role, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:lastname, :firstname, :email, :password, :role])
    |> validate_required([:lastname, :firstname, :email, :password, :role])
  end

end
