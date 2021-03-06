defmodule TodolistWeb.SkillController do
  use TodolistWeb, :controller

  alias Todolist.Schemas
  alias Todolist.Schemas.Skill

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    skills = Schemas.list_skills()
    render(conn, "index.json", skills: skills)
  end

  def create(conn, %{"skill" => skill_params}) do
    with {:ok, %Skill{} = skill} <- Schemas.create_skill(skill_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.skill_path(conn, :show, skill))
      |> render("show.json", skill: skill)
    end
  end

  def show(conn, %{"id" => id}) do
    skill = Schemas.get_skill!(id)
    render(conn, "show.json", skill: skill)
  end

  def update(conn, %{"id" => id, "skill" => skill_params}) do
    skill = Schemas.get_skill!(id)

    with {:ok, %Skill{} = skill} <- Schemas.update_skill(skill, skill_params) do
      render(conn, "show.json", skill: skill)
    end
  end

  def delete(conn, %{"id" => id}) do
    skill = Schemas.get_skill!(id)

    with {:ok, %Skill{}} <- Schemas.delete_skill(skill) do
      send_resp(conn, :no_content, "")
    end
  end
end
