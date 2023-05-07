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
end
