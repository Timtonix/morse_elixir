defmodule MorseElixirTest do
  use ExUnit.Case
  doctest MorseElixir

  test "assert convert morse to text" do
    assert MorseElixir.morse_to_text("... --- ...") == "SOS"
  end

  test "assert convert nothing to nothing" do
    assert MorseElixir.morse_to_text("") == ""
  end

  test "assert convert morse with multiple word to text" do
    assert MorseElixir.morse_to_text("... --- ... / - .. --") == "SOS TIM"
  end

  test "assert convert text to morse" do
    assert MorseElixir.text_to_morse("SOS") == "... --- ..."
  end


  test "assert convert text with space ' ' to morse" do
    assert MorseElixir.text_to_morse("SOS TIM") == "... --- ... / - .. --"
  end

  test "assert convert text with unexpected character to morse" do
    # The * is changed in a space...
    assert MorseElixir.text_to_morse("SOS *TIM") == "... --- ... /  - .. --"
  end

  test "assert convert text that is '' empty, to an empty morse code" do
    assert MorseElixir.text_to_morse("") == ""
  end

  test "assert 'a' is not a morse string" do
    assert MorseElixir.is_morse?("a") == false
  end

  test "assert '... --- ...' is a morse string" do
    assert MorseElixir.is_morse?("... --- ...") == true
  end

  test "assert '' is not morse string" do
    assert MorseElixir.is_morse?("") == false
  end

  test "assert '... --- o...' is not morse string" do
    assert MorseElixir.is_morse?("... --- o...") == false
  end









end
