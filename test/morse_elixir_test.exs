defmodule MorseElixirTest do
  use ExUnit.Case
  doctest MorseElixir

  test "greets the world" do
    assert MorseElixir.hello() == :world
  end
end
