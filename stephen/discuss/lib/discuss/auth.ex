defmodule Discuss.Auth do
  @moduledoc """
  Auth is the context that deal with authentication.
  """

  alias Discuss.User
  alias Discuss.Repo

  @doc """
  Lists all users.
  """
  def list_users() do
    User
    |> Repo.all()
  end

  @doc """
  Creates a user changeset.
  """
  def change_user(user \\ %User{}, attrs \\ %{}) do
    user
    |> User.changeset(attrs)
  end

  @doc """
  Creates a user.
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> change_user(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns a user.
  """
  def get_user(user_id) do
    User
    |> Repo.get(user_id)
  end

  @doc """
  Returns a user.
  Raises an error if it could not be fetched.
  """
  def get_user!(user_id) do
    User
    |> Repo.get!(user_id)
  end

  @doc """
  Updates a user.
  """
  def update_user(%User{} = user, attrs \\ %{}) do
    user
    |> change_user(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.
  """
  def delete_user!(%User{} = user) do
    user
    |> Repo.delete!()
  end
end
