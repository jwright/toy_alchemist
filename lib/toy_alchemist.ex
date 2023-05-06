defmodule ToyAlchemist do
  @moduledoc """
  Performs the commands on the `Alchemist` and keeps track of them on the Elixir Table.
  """

  alias ToyAlchemist.Alchemist

  @doc """
  Moves an `Alchemist` one space in the facing direction.

  ## Examples

    iex> ToyAlchemist.move(%Alchemist{position: 1})
    %Alchemist{position: 2}
  """
  def move(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: position + 1}
  end
end
