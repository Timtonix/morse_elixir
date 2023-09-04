# MorseElixir
This lib is related to [mosrse_traductor](https://github.com/anonymecrasher/morse_traductor).

Example:
- convert morse to text:
```elixir
iex> MorseElixir.morse_to_text(".... . .-.. .-.. --- / .-- --- .-. .-.. -..")
"HELLO WORLD"
```

- convert text to morse:
```elixir
iex> MorseElixir.text_to_morse("HELLO WORLD")
".... . .-.. .-.. --- / .-- --- .-. .-.. -.."
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `morse_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:morse_elixir, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/morse_elixir>.

# cartes
