defmodule ToyAlchemist.SimulationTest do
  use ExUnit.Case

  alias ToyAlchemist.{Alchemist, Placement, Position, Simulation, Table}

  describe "place/2" do
    setup do
      [placement: Placement.new(0, 0, :north), table: Table.new(4, 4)]
    end

    test "when placed in a valid position, returns a simulation", %{
      placement: placement,
      table: table
    } do
      assert {:ok, simulation} = Simulation.place(table, placement)
    end

    test "when placed in a valid position, a simulation is returned with the alchemist in the place",
         %{placement: placement, table: table} do
      {:ok, simulation} = Simulation.place(table, placement)

      assert simulation.alchemist == %Alchemist{
               position: %Position{north: 0, east: 0, west: 0, south: 0},
               facing: :north
             }
    end
  end
end
