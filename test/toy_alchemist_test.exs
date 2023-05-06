defmodule ToyAlchemistTest do
  use ExUnit.Case

  alias ToyAlchemist.Alchemist

  doctest ToyAlchemist

  describe "move/1" do
    test "increments the position of the alchemist" do
      alchemist = Alchemist.new(1)

      assert ToyAlchemist.move(alchemist) == %Alchemist{position: 2}
    end
  end
end
