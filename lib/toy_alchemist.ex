defmodule ToyAlchemist do
  @moduledoc """
  Performs the commands on the `Alchemist` and keeps track of them on the Elixir Table.
  """

  alias ToyAlchemist.Alchemist

  @doc """
  Moves an `Alchemist` one space in the east direction.

  ## Examples

    iex> ToyAlchemist.move_east(%Alchemist{position: %{east: 1}})
    %Alchemist{position: %{east: 2}}
  """
  def move_east(%Alchemist{position: %{east: east} = position} = alchemist) do
    %Alchemist{alchemist | position: %{position | east: east + 1}}
  end

  @doc """
  Moves an `Alchemist` one space in the west direction.

  ## Examples

    iex> ToyAlchemist.move_west(%Alchemist{position: %{east: 1}})
    %Alchemist{position: %{east: 0}}
  """
  def move_west(%Alchemist{position: %{east: east} = position} = alchemist) do
    %Alchemist{alchemist | position: %{position | east: east - 1}}
  end
end
