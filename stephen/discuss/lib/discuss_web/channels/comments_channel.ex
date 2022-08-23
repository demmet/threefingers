defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  @impl true
  def join("comments:" <> topic_id, payload, socket) do
    if authorized?(payload) do
      topic =
        topic_id
        |> String.to_integer()
        |> Discuss.get_topic()

      {:ok, %{}, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (comments:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  def handle_in(wut, %{"content" => content}, socket) do
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
