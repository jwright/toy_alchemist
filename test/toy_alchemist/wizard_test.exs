defmodule ToyAlchemist.WizardTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ToyAlchemist.{Simulation, Wizard}

  doctest Wizard

  describe "cast_spell/1" do
    test "with a place potion returns a simulation with the alchemist placed" do
      assert %Simulation{alchemist: alchemist} =
               Wizard.cast_spell([{:place, [north: 1, east: 3, facing: :east]}])

      assert alchemist.position.north == 1
      assert alchemist.position.east == 3
      assert alchemist.facing == :east
    end

    test "with a place potion returns a simulation with a default table" do
      assert %Simulation{table: table} =
               Wizard.cast_spell([{:place, [north: 4, east: 3, facing: :west]}])

      assert table.north_boundary == 4
      assert table.east_boundary == 4
    end

    test "with a place potion and a placement outside the boundary ignores the error" do
      refute Wizard.cast_spell([{:place, [north: -1, east: 3, facing: :south]}])
    end

    test "ignores potions until a valid placement" do
      assert %Simulation{alchemist: %{position: %{north: 1, east: 4}, facing: :west}} =
               Wizard.cast_spell([{:move}, {:place, [north: 1, east: 4, facing: :west]}])
    end

    test "with a move potion returns a simulation with the moved alchemist" do
      assert %Simulation{alchemist: %{position: %{north: 1, east: 3}, facing: :west}} =
               Wizard.cast_spell([{:place, [north: 1, east: 4, facing: :west]}, {:move}])
    end

    test "ignores any moves above the north boundary" do
      assert %Simulation{alchemist: %{position: %{north: 4, east: 3}, facing: :north}} =
               Wizard.cast_spell([{:place, [north: 4, east: 3, facing: :north]}, {:move}])
    end

    test "ignores any moves above the east boundary" do
      assert %Simulation{alchemist: %{position: %{north: 2, east: 4}, facing: :east}} =
               Wizard.cast_spell([{:place, [north: 2, east: 4, facing: :east]}, {:move}])
    end

    test "ignores any moves above the south boundary" do
      assert %Simulation{alchemist: %{position: %{north: 0, east: 1}, facing: :south}} =
               Wizard.cast_spell([{:place, [north: 0, east: 1, facing: :south]}, {:move}])
    end

    test "ignores any moves above the west boundary" do
      assert %Simulation{alchemist: %{position: %{north: 1, east: 0}, facing: :west}} =
               Wizard.cast_spell([{:place, [north: 1, east: 0, facing: :west]}, {:move}])
    end

    test "with a turn left potion returns a simulation with the turned alchemist" do
      assert %Simulation{alchemist: %{position: %{north: 1, east: 3}, facing: :west}} =
               Wizard.cast_spell([{:place, [north: 1, east: 3, facing: :north]}, {:turn_left}])
    end

    test "with a turn right potion returns a simulation with the turned alchemist" do
      assert %Simulation{alchemist: %{position: %{north: 1, east: 3}, facing: :east}} =
               Wizard.cast_spell([{:place, [north: 1, east: 3, facing: :north]}, {:turn_right}])
    end

    test "with a report potion returns a simulation with the alchemist in the same place" do
      capture_io(fn ->
        assert %Simulation{alchemist: %{position: %{north: 1, east: 3}, facing: :south}} =
                 Wizard.cast_spell([{:place, [north: 1, east: 3, facing: :south]}, {:report}])
      end)
    end

    test "with a report potion it reports the alchemist current position" do
      potions = [
        {:place, [north: 1, east: 3, facing: :south]},
        {:turn_left},
        {:move},
        {:report},
        {:turn_right}
      ]

      report =
        capture_io(fn ->
          Wizard.cast_spell(potions)
        end)

      assert report == "The alchemist is at (1, 4) and facing EAST\n"
    end

    test "with an invalid potion ignores the potion returns the simulation" do
      assert %Simulation{alchemist: %{position: %{north: 1, east: 3}, facing: :north}} =
               Wizard.cast_spell([
                 {:place, [north: 1, east: 3, facing: :north]},
                 {:turn_right},
                 {:invalid, :blah},
                 {:turn_left}
               ])
    end
  end
end
