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
    morse = Map.get(@alphabet_to_morse, String.upcase(head), "")
    morse <> " " <> text_to_morse(tail)
  end

  def text_to_morse(text) do
    String.graphemes(text)
    |> text_to_morse()
    |> String.trim()
  end

  def morse?("" = _string), do: false
  def morse?([] = _charlist), do: false


  def morse?([head | tail]) when tail === [] do
    head in [".", "-", " ", "/"]
  end

  def morse?([head | tail]) do
    if String.contains?(head, [".", "-", " ", "/"]) do
      morse?(tail)
    else
      false
    end
  end

  def morse?(string) do
    list = String.graphemes(string)
    morse?(list)
  end
end

