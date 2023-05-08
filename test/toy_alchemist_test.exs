defmodule ToyAlchemistTest do
  use ExUnit.Case

  alias ToyAlchemist.{Alchemist, Position}

  describe "move/1" do
    test "when facining east, increments the east position" do
      alchemist = Alchemist.new(0, 0, facing: :east) |> ToyAlchemist.move()

      assert alchemist.position == %Position{east: 1, west: -1, north: 0, south: 0}
    end

    test "when facining north, increments the north position" do
      alchemist = Alchemist.new(0, 0, facing: :north) |> ToyAlchemist.move()

      assert alchemist.position == %Position{east: 0, west: 0, north: 1, south: -1}
    end

    test "when facining south, increments the south position" do
      alchemist = Alchemist.new(0, 0, facing: :south) |> ToyAlchemist.move()

      assert alchemist.position == %Position{east: 0, west: 0, north: -1, south: 1}
    end

    test "when facining west, increments the west position" do
      alchemist = Alchemist.new(0, 0, facing: :west) |> ToyAlchemist.move()

      assert alchemist.position == %Position{east: -1, west: 1, north: 0, south: 0}
    end

    test "when facing a weird direction, it does not change the position" do
      alchemist = Alchemist.new(1, 2, facing: :diagonal) |> ToyAlchemist.move()

      assert alchemist.position == %Position{east: 2, west: -2, north: 1, south: -1}
    end

    test "chaining moves" do
      alchemist =
        Alchemist.new(0, 1, facing: :east)
        |> ToyAlchemist.move()
        |> ToyAlchemist.move()
        |> ToyAlchemist.move()

      assert alchemist.position == %Position{east: 4, west: -4, north: 0, south: 0}
    end
  end

  describe "turn_left/1" do
    test "when facining east, it now faces north" do
      alchemist = Alchemist.new(0, 0, facing: :east) |> ToyAlchemist.turn_left()

      assert alchemist.facing == :north
    end

    test "when facining north, it now faces west" do
      alchemist = Alchemist.new(0, 0, facing: :north) |> ToyAlchemist.turn_left()

      assert alchemist.facing == :west
    end

    test "when facining west, it now faces south" do
      alchemist = Alchemist.new(0, 0, facing: :west) |> ToyAlchemist.turn_left()

      assert alchemist.facing == :south
    end

    test "when facining south, it now faces east" do
      alchemist = Alchemist.new(0, 0, facing: :south) |> ToyAlchemist.turn_left()

      assert alchemist.facing == :east
    end

    test "when facing a weird direction, it does not change the direction" do
      alchemist = Alchemist.new(1, 2, facing: :diagonal) |> ToyAlchemist.turn_left()

      assert alchemist.facing == :diagonal
    end
  end
end
