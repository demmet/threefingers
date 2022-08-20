defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Repo

  plug DiscussWeb.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]
  plug :check_topic_owner when action in [:update, :edit, :delete]

  def index(conn, _params) do
    render(conn, "index.html", topics: Discuss.list_topics())
  end

  def show(conn, %{"id" => topic_id}) do
    render(conn, "show.html", topic: Discuss.get_topic!(topic_id))
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: Discuss.change_topic())
  end

  def create(conn, %{"topic" => topic_params}) do
    conn.assigns.user
    |> Discuss.create_topic(topic_params)
    |> case do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Created")
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => topic_id}) do
    topic = Discuss.get_topic(topic_id)
    changeset = Discuss.change_topic(topic)

    render(conn, "edit.html", changeset: changeset, topic: topic)
  end

  def update(conn, %{"id" => topic_id, "topic" => topic_params}) do
    topic = Discuss.get_topic(topic_id)

    topic
    |> Discuss.update_topic(topic_params)
    |> case do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Updated")
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, topic: topic)
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    topic_id
    |> Discuss.get_topic!()
    |> Discuss.delete_topic!()

    conn
    |> put_flash(:info, "Topic Deleted")
    |> redirect(to: Routes.topic_path(conn, :index))
  end

  def check_topic_owner(%{params: %{"id" => topic_id}} = conn, _params) do
    if Discuss.get_topic(topic_id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot edit that")
      |> redirect(to: Routes.topic_path(conn, :index))
      |> halt()
    end
  end
end
