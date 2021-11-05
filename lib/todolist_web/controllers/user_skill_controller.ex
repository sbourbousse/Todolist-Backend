defmodule TodolistWeb.UserSkillController do
  use TodolistWeb, :controller

  alias Todolist.Schemas
  alias Todolist.Schemas.UserSkill

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    users_skills = Schemas.list_users_skills()
    render(conn, "index.json", users_skills: users_skills)
  end

  def create(conn, %{"user_skill" => user_skill_params}) do
    with {:ok, %UserSkill{} = user_skill} <- Schemas.create_user_skill(user_skill_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_skill_path(conn, :show, user_skill))
      |> render("show.json", user_skill: user_skill)
    end
  end

  def show(conn, %{"id" => id}) do
    user_skill = Schemas.get_user_skill!(id)
    render(conn, "show.json", user_skill: user_skill)
  end

  def update(conn, %{"id" => id, "user_skill" => user_skill_params}) do
    user_skill = Schemas.get_user_skill!(id)

    with {:ok, %UserSkill{} = user_skill} <- Schemas.update_user_skill(user_skill, user_skill_params) do
      render(conn, "show.json", user_skill: user_skill)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_skill = Schemas.get_user_skill!(id)

    with {:ok, %UserSkill{}} <- Schemas.delete_user_skill(user_skill) do
      send_resp(conn, :no_content, "")
    end
  end
end
