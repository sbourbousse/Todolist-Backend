defmodule TodolistWeb.UserController do
  use TodolistWeb, :controller

  alias Todolist.Schemas
  alias Todolist.Schemas.User

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    users = Schemas.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Schemas.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Schemas.get_user!(id)
    render(conn, "show.json", user: user)

  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Schemas.get_user!(id)

    with {:ok, %User{} = user} <- Schemas.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Schemas.get_user!(id)

    with {:ok, %User{}} <- Schemas.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    user = Schemas.sign_in(email, password)
    if (user) do
      signer = Joken.Signer.create("HS256", "secret")
      {:ok, token, claims} = TodolistWeb.Token.generate_and_sign(%{"email" => email, "role" => user.role}, signer)
      send_resp(conn, 200, token)
    else
      send_resp(conn, 404, "")
    end
  end
end
