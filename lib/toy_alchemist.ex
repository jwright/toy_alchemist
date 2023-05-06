defmodule ToyAlchemist do
  @moduledoc """
  Performs the commands on the `Alchemist` and keeps track of them on the Elixir Table.
  """

  alias ToyAlchemist.Alchemist

  @doc """
  Moves an `Alchemist` one space in the east direction.

  ## Examples

    iex> ToyAlchemist.move_east(%Alchemist{position: 1})
    %Alchemist{position: 2}
  """
  def move_east(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: position + 1}
  end

  @doc """
  Moves an `Alchemist` one space in the west direction.

  ## Examples

    iex> ToyAlchemist.move_west(%Alchemist{position: 1})
    %Alchemist{position: 0}
  """
  def move_west(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: position - 1}
  end
end
