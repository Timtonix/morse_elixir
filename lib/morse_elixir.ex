defmodule MorseElixir do
  @moduledoc """
  Documentation for `MorseElixir`.
  """

  @morse_to_alphabet  %{".-" => "A", "-..." => "B", "-.-." => "C", "-.." => "D", "." => "E", "..-." => "F", "--." => "G", "...." => "H",
    ".." => "I", ".---" => "J", "-.-" => "K", ".-.." => "L", "--" => "M", "-." => "N", "---" => "O", ".--." => "P",
    "--.-" => "Q", ".-." => "R", "..." => "S", "-" => "T", "..-" => "U", "...-" => "V", ".--" => "W", "-..-" => "X",
    "-.--" => "Y", "--.." => "Z", "-----" => "0", ".----" => "1", "..---" => "2", "...--" => "3", "....-" => "4",
    "....." => "5", "-...." => "6", "--..." => "7", "---.." => "8", "----." => "9", ".-.-.-" => ".", "---..." => " =>", "..--.." => "?",
    "-.--." => "()", "-.--.-" => ")", ".-..." => "&", ".----." => "'", "-.-.-----." => "!", "/" => " "}

  @alphabet_to_morse %{"A" => ".-", "B" => "-...", "C" => "-.-.", "D" => "-..", "E" => ".", "F" => "..-.", "G" => "--.", "H" => "....",
    "I" => "..", "J" => ".---", "K" => "-.-", "L" => ".-..", "M" => "--", "N" => "-.", "O" => "---", "P" => ".--.",
    "Q" => "--.-", "R" => ".-.", "S" => "...", "T" => "-", "U" => "..-", "V" => "...-", "W" => ".--", "X" => "-..-",
    "Y" => "-.--", "Z" => "--..", "0" => "-----", "1" => ".----", "2" => "..---", "3" => "...--", "4" => "....-",
    "5" => ".....", "6" => "-....", "7" => "--...", "8" => "---..", "9" => "----.", "." => ".-.-.-",
    "?" => "..--..", "'" => ".----.", "!" => "-.-.-----.",
    "(" => "-.--.", ")" => "-.--.-", "&" => ".-...", " " => "/"}


  def morse_to_text([]) do
    ""
  end

  def morse_to_text([head | tail]) do
    text = Map.get(@morse_to_alphabet, head, "")
    text <> morse_to_text(tail)
  end

  def morse_to_text(morse)do
    String.split(morse, " ")
    |> morse_to_text()
  end

  def text_to_morse([]) do
    ""
  end

  def text_to_morse([head | tail]) do
    morse = Map.get(@alphabet_to_morse, head, "")
    morse <> " " <> text_to_morse(tail)
  end

  def text_to_morse(text) do
    String.graphemes(text)
    |> text_to_morse()
    |> String.trim()
  end

  def is_morse?([head | tail]) when tail === [] do
    IO.inspect(head)
    if String.contains?(head, [".", "-", " ", "/"]) do
      true
    else
      false
    end
  end

  def is_morse?([head | tail]) do
    if String.contains?(head, ["", ".", "-", " ", "/"]) do
      is_morse?(tail)
    else
      false
    end
  end

  def is_morse?(string) when string === "", do: false

  def is_morse?(string) do
    list = String.graphemes(string)
    is_morse?(list)
  end
end

