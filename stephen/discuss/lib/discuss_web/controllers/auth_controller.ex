defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias Discuss.Auth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    %{
      email: auth.info.email,
      token: auth.credentials.token,
      provider: "github"
    }
    |> Auth.upsert_user()
  end
end
