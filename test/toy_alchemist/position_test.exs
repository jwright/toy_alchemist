defmodule ToyAlchemist.PositionTest do
  use ExUnit.Case

  alias ToyAlchemist.Position

  doctest Position

  describe "new/2" do
    test "sets the noth and east coordinates" do
      assert Position.new(2, 3) == %Position{north: 2, east: 3}
    end
  end
end
