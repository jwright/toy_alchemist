defmodule ToyAlchemistTest do
  use ExUnit.Case
  doctest ToyAlchemist

  test "greets the world" do
    assert ToyAlchemist.hello() == :world
  end
end
