defmodule Todolist.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Accounts` context.
  """

  @doc """
  Generate a skill.
  """
  def skill_fixture(attrs \\ %{}) do
    {:ok, skill} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Todolist.Accounts.create_skill()

    skill
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        firstname: "some firstname",
        lastname: "some lastname",
        password: "some password",
        role: 42
      })
      |> Todolist.Accounts.create_user()

    user
  end
end
