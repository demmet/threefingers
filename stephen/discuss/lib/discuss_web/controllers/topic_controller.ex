defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", topics: Discuss.list_topics())
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: Discuss.change_topic())
  end

  def create(conn, %{"topic" => topic_params}) do
    topic_params
    |> Discuss.create_topic()
    |> case do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic Created")
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
