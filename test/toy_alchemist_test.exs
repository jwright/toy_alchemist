defmodule ToyAlchemistTest do
  use ExUnit.Case

  alias ToyAlchemist.Alchemist

  describe "move_east/1" do
    test "increments the east position of the alchemist" do
      alchemist = Alchemist.new(0, 0)

      assert ToyAlchemist.move_east(alchemist).position.east == 1
    end

    test "chaining incrementing the east position" do
      alchemist =
        Alchemist.new(0, 1)
        |> ToyAlchemist.move_east()
        |> ToyAlchemist.move_east()
        |> ToyAlchemist.move_east()

      assert alchemist.position.east == 4
    end
  end

  describe "move_north/1" do
    test "increments the north position of the alchemist" do
      alchemist = Alchemist.new(0, 0)

      assert ToyAlchemist.move_north(alchemist).position.north == 1
    end

    test "chaining incrementing the north position" do
      alchemist =
        Alchemist.new(3, 0)
        |> ToyAlchemist.move_north()
        |> ToyAlchemist.move_north()
        |> ToyAlchemist.move_north()

      assert alchemist.position.north == 6
    end
  end

  describe "move_south/1" do
    test "decrements the north position of the alchemist" do
      alchemist = Alchemist.new(0, 0)

      assert ToyAlchemist.move_south(alchemist).position.north == -1
    end

    test "chaining decrementing the north position" do
      alchemist =
        Alchemist.new(-1, 0)
        |> ToyAlchemist.move_south()
        |> ToyAlchemist.move_south()
        |> ToyAlchemist.move_south()

      assert alchemist.position.north == -4
    end
  end

  describe "move_west/1" do
    test "decrements the east position of the alchemist" do
      alchemist = Alchemist.new(0, 0)

      assert ToyAlchemist.move_west(alchemist).position.east == -1
    end

    test "chaining decrementing the east position" do
      alchemist =
        Alchemist.new(0, -2)
        |> ToyAlchemist.move_west()
        |> ToyAlchemist.move_west()
        |> ToyAlchemist.move_west()

      assert alchemist.position.east == -5
    end
  end
end
