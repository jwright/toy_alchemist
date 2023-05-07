defmodule ToyAlchemist do
  @moduledoc """
  Performs the commands on the `Alchemist` and keeps track of them on the Elixir Table.
  """

  alias ToyAlchemist.{Alchemist, Position}

  @doc """
  Moves an `Alchemist` one space in the east direction.

  ## Examples

    iex> ToyAlchemist.move_east(%Alchemist{position: %Position{east: 1}})
    %Alchemist{position: %Position{east: 2}}
  """
  def move_east(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: Position.move_east(position)}
  end

  @doc """
  Moves an `Alchemist` one space in the north direction.

  ## Examples

    iex> ToyAlchemist.move_north(%Alchemist{position: %Position{north: 1}})
    %Alchemist{position: %Position{north: 2}}
  """
  def move_north(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: Position.move_north(position)}
  end

  @doc """
  Moves an `Alchemist` one space in the south direction.

  ## Examples

    iex> ToyAlchemist.move_south(%Alchemist{position: %Position{north: -1}})
    %Alchemist{position: %Position{north: -2}}
  """
  def move_south(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: Position.move_south(position)}
  end

  @doc """
  Moves an `Alchemist` one space in the west direction.

  ## Examples

    iex> ToyAlchemist.move_west(%Alchemist{position: %Position{east: 1}})
    %Alchemist{position: %Position{east: 0}}
  """
  def move_west(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: Position.move_west(position)}
  end
end
