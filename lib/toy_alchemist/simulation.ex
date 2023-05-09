defmodule ToyAlchemist.Simulation do
  @moduledoc """
  Performs the commands on the `Alchemist` and keeps track of them on the Elixir Table.
  """

  defstruct [:alchemist, :table]

  alias ToyAlchemist.{Alchemist, Placement, Table}

  def move(%__MODULE__{alchemist: alchemist, table: table} = simulation) do
    moved = alchemist |> Alchemist.move()

    if Table.valid_position?(table, moved.position) do
      {:ok, %{simulation | alchemist: moved}}
    else
      {:error, :out_of_bounds}
    end
  end

  @doc """
  Simulates placing an `Alchemist` on a `Table` at the specified `Placement`.

  ## Examples

    iex> Simulation.place(%Table{north_boundary: 4, east_boundary: 4}, %Placement{north: 0, east: 2, facing: :north})
    {:ok, %Simulation{alchemist: %Alchemist{position: %Position{north: 0, east: 2, south: 0, west: -2}, facing: :north},
                      table: %Table{east_boundary: 4, north_boundary: 4}}}
  """
  def place(%Table{} = table, %Placement{north: north, east: east, facing: facing} = placement) do
    if Table.valid_position?(table, placement) do
      alchemist = Alchemist.new(north, east, facing: facing)

      {:ok, new(alchemist, table)}
    else
      {:error, :invalid_placement}
    end
  end

  defp new(alchemist, table) do
    struct!(__MODULE__, alchemist: alchemist, table: table)
  end
end
