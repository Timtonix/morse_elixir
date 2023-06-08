defmodule MorseElixirTest do
  use ExUnit.Case
  doctest MorseElixir

  test "assert convert morse to text" do
    assert MorseElixir.morse_to_alphabet("... --- ...") == "SOS"
  end
end
