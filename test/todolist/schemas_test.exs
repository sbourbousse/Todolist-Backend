defmodule Todolist.SchemasTest do
  use Todolist.DataCase

  alias Todolist.Schemas

  describe "skills" do
    alias Todolist.Schemas.Skill

    import Todolist.SchemasFixtures

    @invalid_attrs %{name: nil}

    test "list_skills/0 returns all skills" do
      skill = skill_fixture()
      assert Schemas.list_skills() == [skill]
    end

    test "get_skill!/1 returns the skill with given id" do
      skill = skill_fixture()
      assert Schemas.get_skill!(skill.id) == skill
    end

    test "create_skill/1 with valid data creates a skill" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Skill{} = skill} = Schemas.create_skill(valid_attrs)
      assert skill.name == "some name"
    end

    test "create_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schemas.create_skill(@invalid_attrs)
    end

    test "update_skill/2 with valid data updates the skill" do
      skill = skill_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Skill{} = skill} = Schemas.update_skill(skill, update_attrs)
      assert skill.name == "some updated name"
    end

    test "update_skill/2 with invalid data returns error changeset" do
      skill = skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Schemas.update_skill(skill, @invalid_attrs)
      assert skill == Schemas.get_skill!(skill.id)
    end

    test "delete_skill/1 deletes the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{}} = Schemas.delete_skill(skill)
      assert_raise Ecto.NoResultsError, fn -> Schemas.get_skill!(skill.id) end
    end

    test "change_skill/1 returns a skill changeset" do
      skill = skill_fixture()
      assert %Ecto.Changeset{} = Schemas.change_skill(skill)
    end
  end

  describe "users" do
    alias Todolist.Schemas.User

    import Todolist.SchemasFixtures

    @invalid_attrs %{email: nil, firstname: nil, lastname: nil, password: nil, role: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Schemas.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Schemas.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", firstname: "some firstname", lastname: "some lastname", password: "some password", role: 42}

      assert {:ok, %User{} = user} = Schemas.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.firstname == "some firstname"
      assert user.lastname == "some lastname"
      assert user.password == "some password"
      assert user.role == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schemas.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", firstname: "some updated firstname", lastname: "some updated lastname", password: "some updated password", role: 43}

      assert {:ok, %User{} = user} = Schemas.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.firstname == "some updated firstname"
      assert user.lastname == "some updated lastname"
      assert user.password == "some updated password"
      assert user.role == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Schemas.update_user(user, @invalid_attrs)
      assert user == Schemas.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Schemas.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Schemas.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Schemas.change_user(user)
    end
  end

  describe "users_skills" do
    alias Todolist.Schemas.UserSkill

    import Todolist.SchemasFixtures

    @invalid_attrs %{}

    test "list_users_skills/0 returns all users_skills" do
      user_skill = user_skill_fixture()
      assert Schemas.list_users_skills() == [user_skill]
    end

    test "get_user_skill!/1 returns the user_skill with given id" do
      user_skill = user_skill_fixture()
      assert Schemas.get_user_skill!(user_skill.id) == user_skill
    end

    test "create_user_skill/1 with valid data creates a user_skill" do
      valid_attrs = %{}

      assert {:ok, %UserSkill{} = user_skill} = Schemas.create_user_skill(valid_attrs)
    end

    test "create_user_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schemas.create_user_skill(@invalid_attrs)
    end

    test "update_user_skill/2 with valid data updates the user_skill" do
      user_skill = user_skill_fixture()
      update_attrs = %{}

      assert {:ok, %UserSkill{} = user_skill} = Schemas.update_user_skill(user_skill, update_attrs)
    end

    test "update_user_skill/2 with invalid data returns error changeset" do
      user_skill = user_skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Schemas.update_user_skill(user_skill, @invalid_attrs)
      assert user_skill == Schemas.get_user_skill!(user_skill.id)
    end

    test "delete_user_skill/1 deletes the user_skill" do
      user_skill = user_skill_fixture()
      assert {:ok, %UserSkill{}} = Schemas.delete_user_skill(user_skill)
      assert_raise Ecto.NoResultsError, fn -> Schemas.get_user_skill!(user_skill.id) end
    end

    test "change_user_skill/1 returns a user_skill changeset" do
      user_skill = user_skill_fixture()
      assert %Ecto.Changeset{} = Schemas.change_user_skill(user_skill)
    end
  end

  describe "tasks" do
    alias Todolist.Schemas.Task

    import Todolist.SchemasFixtures

    @invalid_attrs %{name: nil, status: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Schemas.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Schemas.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{name: "some name", status: 42}

      assert {:ok, %Task{} = task} = Schemas.create_task(valid_attrs)
      assert task.name == "some name"
      assert task.status == 42
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schemas.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{name: "some updated name", status: 43}

      assert {:ok, %Task{} = task} = Schemas.update_task(task, update_attrs)
      assert task.name == "some updated name"
      assert task.status == 43
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Schemas.update_task(task, @invalid_attrs)
      assert task == Schemas.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Schemas.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Schemas.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Schemas.change_task(task)
    end
  end
end
