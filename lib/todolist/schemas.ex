defmodule Todolist.Schemas do
  @moduledoc """
  The Schemas context.
  """

  import Ecto.Query, warn: false
  alias Todolist.Repo

  alias Todolist.Schemas.Skill

  @doc """
  Returns the list of skills.

  ## Examples

      iex> list_skills()
      [%Skill{}, ...]

  """
  def list_skills do
    Repo.all(Skill)
  end

  @doc """
  Gets a single skill.

  Raises `Ecto.NoResultsError` if the Skill does not exist.

  ## Examples

      iex> get_skill!(123)
      %Skill{}

      iex> get_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skill!(id), do: Repo.get!(Skill, id)

  @doc """
  Creates a skill.

  ## Examples

      iex> create_skill(%{field: value})
      {:ok, %Skill{}}

      iex> create_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skill(attrs \\ %{}) do
    %Skill{}
    |> Skill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a skill.

  ## Examples

      iex> update_skill(skill, %{field: new_value})
      {:ok, %Skill{}}

      iex> update_skill(skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skill(%Skill{} = skill, attrs) do
    skill
    |> Skill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skill.

  ## Examples

      iex> delete_skill(skill)
      {:ok, %Skill{}}

      iex> delete_skill(skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skill(%Skill{} = skill) do
    Repo.delete(skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skill changes.

  ## Examples

      iex> change_skill(skill)
      %Ecto.Changeset{data: %Skill{}}

  """
  def change_skill(%Skill{} = skill, attrs \\ %{}) do
    Skill.changeset(skill, attrs)
  end

  alias Todolist.Schemas.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    new_attr = Map.replace(attrs, "password", Pbkdf2.Base.hash_password(get_in(attrs, ["password"]), "a"))
    %User{}
    |> User.changeset(new_attr)
    |> Repo.insert()
  end


  def sign_in(email, password) do
    query =
      from user in User,
        where: user.email == ^email and user.password == ^Pbkdf2.Base.hash_password(password, "a")
    # IO.puts(Pbkdf2.Base.hash_password("dadz", "a"))
    Repo.one(query)
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias Todolist.Schemas.UserSkill

  @doc """
  Returns the list of users_skills.

  ## Examples

      iex> list_users_skills()
      [%UserSkill{}, ...]

  """
  def list_users_skills do
    Repo.all(UserSkill)
  end

  @doc """
  Gets a single user_skill.

  Raises `Ecto.NoResultsError` if the User skill does not exist.

  ## Examples

      iex> get_user_skill!(123)
      %UserSkill{}

      iex> get_user_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_skill!(id), do: Repo.get!(UserSkill, id)

  @doc """
  Creates a user_skill.

  ## Examples

      iex> create_user_skill(%{field: value})
      {:ok, %UserSkill{}}

      iex> create_user_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_skill(attrs \\ %{}) do
    %UserSkill{}
    |> UserSkill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_skill.

  ## Examples

      iex> update_user_skill(user_skill, %{field: new_value})
      {:ok, %UserSkill{}}

      iex> update_user_skill(user_skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_skill(%UserSkill{} = user_skill, attrs) do
    user_skill
    |> UserSkill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_skill.

  ## Examples

      iex> delete_user_skill(user_skill)
      {:ok, %UserSkill{}}

      iex> delete_user_skill(user_skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_skill(%UserSkill{} = user_skill) do
    Repo.delete(user_skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_skill changes.

  ## Examples

      iex> change_user_skill(user_skill)
      %Ecto.Changeset{data: %UserSkill{}}

  """
  def change_user_skill(%UserSkill{} = user_skill, attrs \\ %{}) do
    UserSkill.changeset(user_skill, attrs)
  end

  alias Todolist.Schemas.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{data: %Task{}}

  """
  def change_task(%Task{} = task, attrs \\ %{}) do
    Task.changeset(task, attrs)
  end
end
