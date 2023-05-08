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
    %Alchemist{%Position{north: 3, east: 4, south: -3, west: -4}, facing: :south}
  """
  def new(north \\ 0, east \\ 0, opts \\ []) do
    facing = Keyword.get(opts, :facing, :north)

    struct!(__MODULE__, facing: facing, position: Position.new(north, east))
  end
end
