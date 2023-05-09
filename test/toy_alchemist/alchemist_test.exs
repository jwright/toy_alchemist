defmodule ToyAlchemist.AlchemistTest do
  use ExUnit.Case

  alias ToyAlchemist.{Alchemist, Position}

  doctest Alchemist

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

  describe "move/1" do
    test "when facining east, increments the east position" do
      alchemist = Alchemist.new(0, 0, facing: :east) |> Alchemist.move()

      assert alchemist.position == %Position{east: 1, west: -1, north: 0, south: 0}
    end

    test "when facining north, increments the north position" do
      alchemist = Alchemist.new(0, 0, facing: :north) |> Alchemist.move()

      assert alchemist.position == %Position{east: 0, west: 0, north: 1, south: -1}
    end

    test "when facining south, increments the south position" do
      alchemist = Alchemist.new(0, 0, facing: :south) |> Alchemist.move()

      assert alchemist.position == %Position{east: 0, west: 0, north: -1, south: 1}
    end

    test "when facining west, increments the west position" do
      alchemist = Alchemist.new(0, 0, facing: :west) |> Alchemist.move()

      assert alchemist.position == %Position{east: -1, west: 1, north: 0, south: 0}
    end

    test "when facing a weird direction, it does not change the position" do
      alchemist = Alchemist.new(1, 2, facing: :diagonal) |> Alchemist.move()

      assert alchemist.position == %Position{east: 2, west: -2, north: 1, south: -1}
    end

    test "chaining moves" do
      alchemist =
        Alchemist.new(0, 1, facing: :east)
        |> Alchemist.move()
        |> Alchemist.move()
        |> Alchemist.move()

      assert alchemist.position == %Position{east: 4, west: -4, north: 0, south: 0}
    end
  end

  describe "turn_left/1" do
    test "when facining east, it now faces north" do
      alchemist = Alchemist.new(0, 0, facing: :east) |> Alchemist.turn_left()

      assert alchemist.facing == :north
    end

    test "when facining north, it now faces west" do
      alchemist = Alchemist.new(0, 0, facing: :north) |> Alchemist.turn_left()

      assert alchemist.facing == :west
    end

    test "when facining west, it now faces south" do
      alchemist = Alchemist.new(0, 0, facing: :west) |> Alchemist.turn_left()

      assert alchemist.facing == :south
    end

    test "when facining south, it now faces east" do
      alchemist = Alchemist.new(0, 0, facing: :south) |> Alchemist.turn_left()

      assert alchemist.facing == :east
    end

    test "when facing a weird direction, it does not change the direction" do
      alchemist = Alchemist.new(1, 2, facing: :diagonal) |> Alchemist.turn_left()

      assert alchemist.facing == :diagonal
    end

    test "chaining turns" do
      alchemist =
        Alchemist.new(0, 1, facing: :east)
        |> Alchemist.turn_left()
        |> Alchemist.turn_left()
        |> Alchemist.turn_left()

      assert alchemist.facing == :south
    end
  end

  describe "turn_right/1" do
    test "when facining east, it now faces south" do
      alchemist = Alchemist.new(0, 0, facing: :east) |> Alchemist.turn_right()

      assert alchemist.facing == :south
    end

    test "when facining north, it now faces east" do
      alchemist = Alchemist.new(0, 0, facing: :north) |> Alchemist.turn_right()

      assert alchemist.facing == :east
    end

    test "when facining west, it now faces north" do
      alchemist = Alchemist.new(0, 0, facing: :west) |> Alchemist.turn_right()

      assert alchemist.facing == :north
    end

    test "when facining south, it now faces west" do
      alchemist = Alchemist.new(0, 0, facing: :south) |> Alchemist.turn_right()

      assert alchemist.facing == :west
    end

    test "when facing a weird direction, it does not change the direction" do
      alchemist = Alchemist.new(1, 2, facing: :diagonal) |> Alchemist.turn_right()

      assert alchemist.facing == :diagonal
    end

    test "chaining turns" do
      alchemist =
        Alchemist.new(0, 1, facing: :east)
        |> Alchemist.turn_right()
        |> Alchemist.turn_right()
        |> Alchemist.turn_right()

      assert alchemist.facing == :north
    end
  end

  describe "chaining movement" do
    test "ends up in the correct location and facing the correct direction" do
      alchemist =
        Alchemist.new(0, 0, facing: :north)
        |> Alchemist.move()
        |> Alchemist.turn_right()
        |> Alchemist.move()
        |> Alchemist.turn_left()
        |> Alchemist.move()
        |> Alchemist.move()
        |> Alchemist.turn_left()
        |> Alchemist.move()
        |> Alchemist.turn_right()
        |> Alchemist.turn_right()
        |> Alchemist.move()
        |> Alchemist.move()
        |> Alchemist.move()

      assert alchemist.position.north == 3
      assert alchemist.position.east == 3
      assert alchemist.facing == :east
    end
  end
end
