defmodule ToyAlchemist.Wizard do
  @moduledoc """
  Performs a list of potions that were interpreted from a `PositionInterpreter`.
  """

  alias ToyAlchemist.{Placement, Simulation, Table}

  @doc """
  Enumerates through a list of potions that were converted into Wizardry instructions
  and performs those potions within a `Simulation`.

  After all of the valid potions are casted, the resulting `Simulation` is returned.

  ## Examples

    iex> Wizard.cast_spell([{:place, [north: 1, east: 3, facing: :north]}, :move, :turn_left, :move])
    %Simulation{alchemist: %ToyAlchemist.Alchemist{position: %ToyAlchemist.Position{north: 2, east: 2, south: -2, west: -2}, facing: :west},
                table: %ToyAlchemist.Table{north_boundary: 4, east_boundary: 4}}
  """
  def cast_spell([{:place, placement} | remaining]) do
    case Simulation.place(default_table(), Placement.from_map(placement)) do
      {:ok, simulation} -> cast_spell(remaining, simulation)
      {:error, :invalid_placement} -> cast_spell(remaining)
    end
  end

  def cast_spell([_unknown | remaining]), do: cast_spell(remaining)
  def cast_spell([]), do: nil

  defp cast_spell([{:invalid, _potion} | remaining], simulation),
    do: cast_spell(remaining, simulation)

  defp cast_spell([:move | remaining], simulation) do
    case Simulation.move(simulation) do
      {:ok, simulation} -> cast_spell(remaining, simulation)
      {:error, :out_of_bounds} -> cast_spell(remaining, simulation)
    end
  end

  defp cast_spell([:report | remaining], simulation) do
    simulation |> Simulation.report() |> report_on()
    cast_spell(remaining, simulation)
  end

  defp cast_spell([:turn_left | remaining], simulation) do
    {:ok, simulation} = simulation |> Simulation.turn_left()
    cast_spell(remaining, simulation)
  end

  defp cast_spell([:turn_right | remaining], simulation) do
    {:ok, simulation} = simulation |> Simulation.turn_right()
    cast_spell(remaining, simulation)
  end

  defp cast_spell([], simulation), do: simulation

  defp default_table(opts \\ []) do
    north_boundary = Keyword.get(opts, :north_boundary, 4)
    east_boundary = Keyword.get(opts, :east_boundary, 4)

    Table.new(north_boundary, east_boundary)
  end

  defp report_on(%{position: %{north: north, east: east}, facing: facing}) do
    direction = facing |> to_string() |> String.upcase()

    IO.puts("The alchemist is at (#{north}, #{east}) and facing #{direction}")
  end
end
