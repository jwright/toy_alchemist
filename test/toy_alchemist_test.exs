defmodule ToyAlchemistTest do
  use ExUnit.Case

  alias ToyAlchemist.Alchemist

  doctest ToyAlchemist

  describe "move_east/1" do
    test "increments the x-axis of the alchemist" do
      alchemist = Alchemist.new(0)

      assert ToyAlchemist.move_east(alchemist) == %Alchemist{position: 1}
    end

    test "chaining incrementing the east position" do
      alchemist =
        Alchemist.new(1)
        |> ToyAlchemist.move_east()
        |> ToyAlchemist.move_east()
        |> ToyAlchemist.move_east()

      assert alchemist == %Alchemist{position: 4}
    end
  end

  describe "move_west/1" do
    test "decrements the x-axis of the alchemist" do
      alchemist = Alchemist.new(0)

      assert ToyAlchemist.move_west(alchemist) == %Alchemist{position: -1}
    end

    test "chaining incrementing the west position" do
      alchemist =
        Alchemist.new(-2)
        |> ToyAlchemist.move_west()
        |> ToyAlchemist.move_west()
        |> ToyAlchemist.move_west()

      assert alchemist == %Alchemist{position: -5}
    end
  end
end
