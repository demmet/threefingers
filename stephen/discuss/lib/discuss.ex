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
    Topic
    |> Repo.all()
  end

  @doc """
  Creates a topic changeset.
  """
  def change_topic(topic \\ %Topic{}, attrs \\ %{}) do
    topic
    |> Topic.changeset(attrs)
  end

  @doc """
  Creates a topic.
  """
  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> change_topic(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns a topic.
  """
  def get_topic(topic_id) do
    Topic
    |> Repo.get(topic_id)
  end

  @doc """
  Returns a topic.
  Raises an error if it could not be fetched.
  """
  def get_topic!(topic_id) do
    Topic
    |> Repo.get!(topic_id)
  end

  @doc """
  Updates a topic.
  """
  def update_topic(%Topic{} = topic, attrs \\ %{}) do
    topic
    |> change_topic(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a topic.
  """
  def delete_topic!(%Topic{} = topic) do
    topic
    |> Repo.delete!()
  end
end
