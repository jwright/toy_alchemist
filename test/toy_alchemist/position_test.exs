defmodule ToyAlchemist.PositionTest do
  use ExUnit.Case

  alias ToyAlchemist.Position

  doctest Position

  describe "new/2" do
    test "sets the noth and east coordinates" do
      assert Position.new(2, 3) == %Position{north: 2, east: 3, west: -3}
    end
  end

  describe "move_east/1" do
    test "increments the east position of the position" do
      position = Position.new(0, 0)

      assert Position.move_east(position) == %Position{east: 1, north: 0, west: -1}
    end
  end

  describe "move_north/1" do
    test "increments the north position of the position" do
      position = Position.new(0, 0)

      assert Position.move_north(position) == %Position{east: 0, north: 1, west: 0}
    end
  end

  describe "move_west/1" do
    test "decrements the east position of the position" do
      position = Position.new(0, 0)

      assert Position.move_west(position) == %Position{east: -1, north: 0, west: 1}
    end
  end

  describe "west/0" do
    test "set to the negative of the east" do
      assert Position.new(0, 4).west == -4
    end
  end
end
