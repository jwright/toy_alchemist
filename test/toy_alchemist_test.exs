defmodule ToyAlchemistTest do
  use ExUnit.Case

  alias ToyAlchemist.Alchemist

  doctest ToyAlchemist

  describe "move_east/1" do
    test "increments the east position of the alchemist" do
      alchemist = Alchemist.new(0, 0)

      assert ToyAlchemist.move_east(alchemist) == %Alchemist{position: %{east: 1, north: 0}}
    end

    test "chaining incrementing the east position" do
      alchemist =
        Alchemist.new(0, 1)
        |> ToyAlchemist.move_east()
        |> ToyAlchemist.move_east()
        |> ToyAlchemist.move_east()

      assert alchemist == %Alchemist{position: %{east: 4, north: 0}}
    end
  end

  describe "move_west/1" do
    test "decrements the east position of the alchemist" do
      alchemist = Alchemist.new(0, 0)

      assert ToyAlchemist.move_west(alchemist) == %Alchemist{position: %{east: -1, north: 0}}
    end

    test "chaining decrementing the east position" do
      alchemist =
        Alchemist.new(0, -2)
        |> ToyAlchemist.move_west()
        |> ToyAlchemist.move_west()
        |> ToyAlchemist.move_west()

      assert alchemist == %Alchemist{position: %{east: -5, north: 0}}
    end
  end
end
