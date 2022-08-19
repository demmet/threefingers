defmodule Discuss do
  @moduledoc """
  Discuss keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Discuss.Topic
  alias Discuss.Repo

  @doc """
  Lists all topics.
  """
  def list_topics() do
    %Topic{}
    |> Repo.all()
  end

  @doc """
  Creates a topic.
  """
  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end
end
