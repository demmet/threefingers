defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic
  alias Discuss.Repo

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    %Topic{}
    |> Topic.changeset(topic)
    |> Repo.insert
    |> case do
      {:ok, topic} -> IO.inspect(topic)
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
    # changeset = Topic.changeset(%Tipoc{}, topic)

    # Repo.insert(changeset)
  end
end
