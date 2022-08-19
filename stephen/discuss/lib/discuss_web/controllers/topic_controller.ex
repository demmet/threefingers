defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic

  def index(conn, _params) do
    render(conn, "index.html", topics: Discuss.list_topics())
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic_params}) do
    Discuss.create_topic(topic_params)
    |> case do
      {:ok, topic} -> IO.inspect(topic)
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end