defmodule ToyAlchemist.AlchemistTest do
  use ExUnit.Case

  alias ToyAlchemist.Alchemist

  describe "new/1" do
    test "returns an Alchemist with defaults" do
      assert Alchemist.new() == %Alchemist{
               position: %ToyAlchemist.Position{north: 0, east: 0, south: 0, west: 0},
               facing: :north
             }
    end

    test "allows to specify the facing direction" do
      assert Alchemist.new(0, 0, facing: :south).facing == :south
    end
  end
end
