defmodule Discuss.Topic do
  use Discuss, :model

  schema "topics" do
    field :title, :string
  end
end
