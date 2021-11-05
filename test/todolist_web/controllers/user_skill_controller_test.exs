defmodule TodolistWeb.UserSkillControllerTest do
  use TodolistWeb.ConnCase

  import Todolist.SchemasFixtures

  alias Todolist.Schemas.UserSkill

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users_skills", %{conn: conn} do
      conn = get(conn, Routes.user_skill_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_skill" do
    test "renders user_skill when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_skill_path(conn, :create), user_skill: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_skill_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_skill_path(conn, :create), user_skill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_skill" do
    setup [:create_user_skill]

    test "renders user_skill when data is valid", %{conn: conn, user_skill: %UserSkill{id: id} = user_skill} do
      conn = put(conn, Routes.user_skill_path(conn, :update, user_skill), user_skill: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_skill_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_skill: user_skill} do
      conn = put(conn, Routes.user_skill_path(conn, :update, user_skill), user_skill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_skill" do
    setup [:create_user_skill]

    test "deletes chosen user_skill", %{conn: conn, user_skill: user_skill} do
      conn = delete(conn, Routes.user_skill_path(conn, :delete, user_skill))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_skill_path(conn, :show, user_skill))
      end
    end
  end

  defp create_user_skill(_) do
    user_skill = user_skill_fixture()
    %{user_skill: user_skill}
  end
end
