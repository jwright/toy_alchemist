defmodule ToyAlchemist.SimulationTest do
  use ExUnit.Case

  alias ToyAlchemist.{Alchemist, Placement, Position, Simulation, Table}

  doctest Simulation

  describe "move/1" do
    setup do
      table = Table.new(4, 4)
      placement = Placement.new(0, 0, :north)

      {:ok, simulation} = Simulation.place(table, placement)

      [simulation: simulation, table: table]
    end

    test "when moving to a valid position, a simulation is returned with the alchemist in the updated position",
         %{simulation: simulation} do
      assert {:ok, %{alchemist: alchemist}} = Simulation.move(simulation)
      assert alchemist.facing == :north
      assert alchemist.position.east == 0
      assert alchemist.position.north == 1
    end

    test "when moving out of bounds, an error is returned", %{table: table} do
      placement = Placement.new(4, 0, :north)

      {:ok, simulation} = Simulation.place(table, placement)

      assert {:error, :out_of_bounds} = Simulation.move(simulation)
    end
  end

  describe "place/2" do
    setup do
      [placement: Placement.new(0, 0, :north), table: Table.new(4, 4)]
    end

    test "when placed in a valid position, returns a simulation", %{
      placement: placement,
      table: table
    } do
      assert {:ok, _simulation} = Simulation.place(table, placement)
    end

    test "when placed in a valid position, a simulation is returned with the alchemist in the place",
         %{placement: placement, table: table} do
      {:ok, %{alchemist: alchemist}} = Simulation.place(table, placement)

      assert alchemist == %Alchemist{
               position: %Position{north: 0, east: 0, west: 0, south: 0},
               facing: :north
             }
    end

    test "when placed in a valid position, a simulation is returned with the table attached", %{
      placement: placement,
      table: table
    } do
      {:ok, simulation} = Simulation.place(table, placement)

      assert simulation.table == table
    end

    test "when placed out of bounds, an error is returned", %{table: table} do
      assert {:error, :invalid_placement} = Simulation.place(table, Placement.new(5, 2))
    end
  end

  describe "report/1" do
    setup do
      table = Table.new(4, 4)
      placement = Placement.new(0, 0, :north)

      {:ok, simulation} = Simulation.place(table, placement)

      [simulation: simulation]
    end

    test "an alchemist is returned so it can be reported on",
         %{simulation: simulation} do
      assert alchemist = Simulation.report(simulation)
      assert alchemist == simulation.alchemist
    end
  end

  describe "turn_left/1" do
    setup do
      table = Table.new(4, 4)
      placement = Placement.new(0, 0, :north)

      {:ok, simulation} = Simulation.place(table, placement)

      [simulation: simulation]
    end

    test "a simulation is returned with the alchemist in the updated direction",
         %{simulation: simulation} do
      assert {:ok, %{alchemist: alchemist}} = Simulation.turn_left(simulation)
      assert alchemist.facing == :west
    end
  end

  describe "turn_right/1" do
    setup do
      table = Table.new(4, 4)
      placement = Placement.new(0, 0, :north)

      {:ok, simulation} = Simulation.place(table, placement)

      [simulation: simulation]
    end

    test "a simulation is returned with the alchemist in the updated direction",
         %{simulation: simulation} do
      assert {:ok, %{alchemist: alchemist}} = Simulation.turn_right(simulation)
      assert alchemist.facing == :east
    end
  end
end
