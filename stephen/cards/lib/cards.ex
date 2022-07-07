defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    deck |> Enum.split(hand_size)
  end

  def deal_poker_table(hand_size) do
    deck = create_deck() |> shuffle
    {sb, deck} = deal(deck, hand_size)
    {bb, deck} = deal(deck, hand_size)
    {utg, deck} = deal(deck, hand_size)
    {utg2, deck} = deal(deck, hand_size)
    {utg3, deck} = deal(deck, hand_size)
    {hijack, deck} = deal(deck, hand_size)
    {cutoff, deck} = deal(deck, hand_size)
    {button, deck} = deal(deck, hand_size)

    {flop, deck} = deal(deck, 3)
    {turn, deck} = deal(deck, 1)
    {river, _deck} = deal(deck, 1)
    {[sb, bb, utg, utg2, utg3, hijack, cutoff, button], [flop, turn, river]}
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end
  end
end
