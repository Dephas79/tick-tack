defmodule TttEngineTest do
  use ExUnit.Case
  doctest TttEngine

  test "greets the world" do
    assert TttEngine.hello() == :world
  end
end
