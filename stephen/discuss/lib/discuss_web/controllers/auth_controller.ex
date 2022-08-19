defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias Discuss.Auth

  def callback(conn, params) do
    signin(conn)
  end

  defp signin(%{assigns: %{ueberauth_auth: auth}} = conn) do
    %{
      email: auth.info.email,
      token: auth.credentials.token,
      provider: "github"
    }
    |> Auth.upsert_user()
    |> case do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
  end
end
