defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """
 
  def main(input) do
    input
    |> hash_input
  end

  def hash_input(input) do
    hex =
      :md5
      |> :crypto.hash(input)
      |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
