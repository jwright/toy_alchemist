defmodule ToyAlchemistTest do
  use ExUnit.Case

  alias ToyAlchemist.Alchemist

  doctest ToyAlchemist

  describe "move_east/1" do
    test "increments the east position of the alchemist" do
      alchemist = Alchemist.new(1)

      assert ToyAlchemist.move_east(alchemist) == %Alchemist{position: 2}
    end
  end
end
