defmodule ToyAlchemist.Alchemist do
  @moduledoc """
  A wizard that is located and facing a direction within a Simulation.
  """

  defstruct [:facing, :position]

  alias ToyAlchemist.Position

  @doc """
  Populates a new `Alchemist` struct with the specified attributes

  ## Examples

    iex> Alchemist.new(3, 4, facing: :south)
    %Alchemist{position: %ToyAlchemist.Position{north: 3, east: 4, south: -3, west: -4}, facing: :south}
  """
  def new(north \\ 0, east \\ 0, opts \\ []) do
    facing = Keyword.get(opts, :facing, :north)

    struct!(__MODULE__, facing: facing, position: Position.new(north, east))
  end

  @doc """
  Moves an `Alchemist` one space in the direction the alchemist is currently facing.

  ## Examples

    iex> Alchemist.move(%Alchemist{position: %Position{east: 2, north: 2, south: -2, west: -2}, facing: :east})
    %Alchemist{position: %Position{east: 3, north: 2, west: -3, south: -2}, facing: :east}
  """
  def move(%__MODULE__{facing: facing} = alchemist) do
    case facing do
      :north -> alchemist |> move_north()
      :east -> alchemist |> move_east()
      :south -> alchemist |> move_south()
      :west -> alchemist |> move_west()
      _ -> alchemist
    end
  end

  defp move_east(%__MODULE__{position: position} = alchemist) do
    %__MODULE__{alchemist | position: Position.move_east(position)}
  end

  defp move_north(%__MODULE__{position: position} = alchemist) do
    %__MODULE__{alchemist | position: Position.move_north(position)}
  end

  defp move_south(%__MODULE__{position: position} = alchemist) do
    %__MODULE__{alchemist | position: Position.move_south(position)}
  end

  defp move_west(%__MODULE__{position: position} = alchemist) do
    %__MODULE__{alchemist | position: Position.move_west(position)}
  end

  @doc """
  Turns an `Alchemist` one direction to the left and updates the facing direction to
  the new direction it is using.

  ## Examples

    iex> Alchemist.turn_left(%Alchemist{facing: :east})
    %Alchemist{facing: :north}
  """
  def turn_left(%__MODULE__{facing: facing} = alchemist) do
    case facing do
      :north -> %__MODULE__{alchemist | facing: :west}
      :east -> %__MODULE__{alchemist | facing: :north}
      :south -> %__MODULE__{alchemist | facing: :east}
      :west -> %__MODULE__{alchemist | facing: :south}
      _ -> alchemist
    end
  end

  @doc """
  Turns an `Alchemist` one direction to the right and updates the facing direction to
  the new direction it is using.

  ## Examples

    iex> Alchemist.turn_right(%Alchemist{facing: :east})
    %Alchemist{facing: :south}
  """
  def turn_right(%__MODULE__{facing: facing} = alchemist) do
    case facing do
      :north -> %__MODULE__{alchemist | facing: :east}
      :east -> %__MODULE__{alchemist | facing: :south}
      :south -> %__MODULE__{alchemist | facing: :west}
      :west -> %__MODULE__{alchemist | facing: :north}
      _ -> alchemist
    end
  end
end
