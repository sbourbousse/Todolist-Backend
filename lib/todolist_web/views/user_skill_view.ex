defmodule TodolistWeb.UserSkillView do
  use TodolistWeb, :view
  alias TodolistWeb.UserSkillView

  def render("index.json", %{users_skills: users_skills}) do
    %{data: render_many(users_skills, UserSkillView, "user_skill.json")}
  end

  def render("show.json", %{user_skill: user_skill}) do
    %{data: render_one(user_skill, UserSkillView, "user_skill.json")}
  end

  def render("user_skill.json", %{user_skill: user_skill}) do
    %{
      id: user_skill.id
    }
  end
end
