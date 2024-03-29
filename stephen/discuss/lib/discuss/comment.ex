defmodule Discuss.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :content, :string
    belongs_to :user, Discuss.Auth.User
    belongs_to :topic, Discuss.Topic

    timestamps
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
