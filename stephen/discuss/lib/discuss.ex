defmodule Discuss do
  @moduledoc """
  Discuss keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  import Ecto

  alias Discuss.Auth.User
  alias Discuss.Repo
  alias Discuss.Comment
  alias Discuss.Topic

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
  def create_topic(%User{} = user, %{} = attrs) do
    user
    |> build_assoc(:topics)
    |> change_topic(attrs)
    |> Repo.insert()
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


  @doc """
  Lists all comments.
  """
  def list_comments() do
    Comment
    |> Repo.all()
  end

  @doc """
  Creates a comment changeset.
  """
  def change_comment(comment \\ %Comment{}, attrs \\ %{}) do
    comment
    |> Comment.changeset(attrs)
  end

  @doc """
  Creates a comment.
  """
  def create_comment(%Topic{} = topic, user_id, %{} = attrs) do
    topic
    |> build_assoc(:comments, user_id: user_id)
    |> change_comment(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a comment.
  """
  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> change_comment(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns a comment.
  """
  def get_comment(comment_id) do
    Comment
    |> Repo.get(comment_id)
  end

  @doc """
  Returns a comment.
  Raises an error if it could not be fetched.
  """
  def get_comment!(comment_id) do
    Comment
    |> Repo.get!(comment_id)
  end

  @doc """
  Updates a comment.
  """
  def update_comment(%Comment{} = comment, attrs \\ %{}) do
    comment
    |> change_comment(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a comment.
  """
  def delete_comment!(%Comment{} = comment) do
    comment
    |> Repo.delete!()
  end
end
