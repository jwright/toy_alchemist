defmodule ToyAlchemist.Wizard do
  alias ToyAlchemist.{Placement, Simulation, Table}

  def cast_spell([{:place, placement} | remaining]) do
    case Simulation.place(default_table(), Placement.from_map(placement)) do
      {:ok, simulation} -> cast_spell(remaining, simulation)
      {:error, :invalid_placement} -> cast_spell(remaining)
    end
  end

  def cast_spell([_unknown | remaining]), do: cast_spell(remaining)
  def cast_spell([]), do: nil

  def cast_spell([{:invalid, _potion} | remaining], simulation),
    do: cast_spell(remaining, simulation)

  def cast_spell([:move | remaining], simulation) do
    case Simulation.move(simulation) do
      {:ok, simulation} -> cast_spell(remaining, simulation)
      {:error, :out_of_bounds} -> cast_spell(remaining, simulation)
    end
  end

  def cast_spell([:report | remaining], simulation) do
    simulation |> Simulation.report() |> report_on()
    cast_spell(remaining, simulation)
  end

  def cast_spell([:turn_left | remaining], simulation) do
    {:ok, simulation} = simulation |> Simulation.turn_left()
    cast_spell(remaining, simulation)
  end

  def cast_spell([:turn_right | remaining], simulation) do
    {:ok, simulation} = simulation |> Simulation.turn_right()
    cast_spell(remaining, simulation)
  end

  def cast_spell([], simulation), do: simulation

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
