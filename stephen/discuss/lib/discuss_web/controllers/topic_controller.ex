defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  def new(conn, params) do
    IO.inspect(conn, label: "conn")
    IO.inspect(params, label: "params")
    render(conn, "new.html")
  end

  def create(conn, params) do
    IO.inspect(params)
  end
end
