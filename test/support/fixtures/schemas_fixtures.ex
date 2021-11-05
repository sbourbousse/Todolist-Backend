defmodule Todolist.SchemasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Schemas` context.
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
      |> Todolist.Schemas.create_skill()

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
      |> Todolist.Schemas.create_user()

    user
  end

  @doc """
  Generate a user_skill.
  """
  def user_skill_fixture(attrs \\ %{}) do
    {:ok, user_skill} =
      attrs
      |> Enum.into(%{

      })
      |> Todolist.Schemas.create_user_skill()

    user_skill
  end

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        name: "some name",
        status: 42
      })
      |> Todolist.Schemas.create_task()

    task
  end
end
