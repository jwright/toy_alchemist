defmodule ToyAlchemist.Simulation do
  @moduledoc """
  Performs the commands on the `Alchemist` and keeps track of them on the Elixir Table.
  """

  defstruct [:alchemist, :table]

  alias ToyAlchemist.{Alchemist, Placement, Table}

  @doc """
  Simulates moving an `Alchemist` on a `Table` by one space in the direction it is facing.

  It returns an `{:error, :out_of_bounds}` Tuple if the move would cause the `Alchemist` to fall
  oof of the Table`.

  ## Examples

    iex> Simulation.move(%Simulation{alchemist: %Alchemist{position: %Position{north: 4, east: 2, south: -4, west: -3},
    ...>                                                   facing: :east}, table: %Table{north_boundary: 4, east_boundary: 4}})
    {:ok, %Simulation{alchemist: %Alchemist{position: %Position{north: 4, east: 3, south: -4, west: -3}, facing: :east},
                      table: %Table{east_boundary: 4, north_boundary: 4}}}
  """
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

  @doc """
  Returns the `Alchemist` of the `Simulation` so it can be reported on.

  ## Examples

    iex> Simulation.report(%Simulation{alchemist: %Alchemist{facing: :north}})
    %Alchemist{facing: :north}
  """
  def report(%__MODULE__{alchemist: alchemist}), do: alchemist

  @doc """
  Simulates turning an `Alchemist` on a `Table` to the left of where it is currently facing.

  ## Examples

    iex> Simulation.turn_left(%Simulation{alchemist: %Alchemist{facing: :east}})
    {:ok, %Simulation{alchemist: %Alchemist{facing: :north}}}
  """
  def turn_left(%__MODULE__{alchemist: alchemist} = simulation) do
    {:ok, %{simulation | alchemist: alchemist |> Alchemist.turn_left()}}
  end

  @doc """
  Simulates turning an `Alchemist` on a `Table` to the right of where it is currently facing.

  ## Examples

    iex> Simulation.turn_right(%Simulation{alchemist: %Alchemist{facing: :east}})
    {:ok, %Simulation{alchemist: %Alchemist{facing: :south}}}
  """
  def turn_right(%__MODULE__{alchemist: alchemist} = simulation) do
    {:ok, %{simulation | alchemist: alchemist |> Alchemist.turn_right()}}
  end

  defp new(alchemist, table) do
    struct!(__MODULE__, alchemist: alchemist, table: table)
  end
end
