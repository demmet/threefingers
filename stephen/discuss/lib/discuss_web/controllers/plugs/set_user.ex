defmodule DiscussWeb.Plugs.SetUser do
  use DiscussWeb, :controller

  alias Discuss.Auth
  alias Discuss.Auth.User
  alias Discuss.Repo

  def init(_params), do: nil

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Auth.get_user(user_id) ->
        assign(conn, :user, user)

      true ->
        assign(conn, :user, nil)
    end
  end
end
