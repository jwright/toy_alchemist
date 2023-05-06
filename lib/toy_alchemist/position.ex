defmodule ToyAlchemist.Position do
  defstruct [:north, :east, :west]

  def new(north, east) do
    struct!(__MODULE__, %{north: north, east: east, west: east * -1})
  end

  @doc """
  Moves a Position` one space in the east direction.

  ## Examples

    iex> Position.move_east(%Position{east: 1})
    %Position{east: 2, west: -2}
  """
  def move_east(%__MODULE__{east: east} = position) do
    east = east + 1
    %__MODULE__{position | east: east, west: east * -1}
  end

  @doc """
  Moves a Position` one space in the north direction.

  ## Examples

    iex> Position.move_north(%Position{north: 2})
    %Position{north: 3}
  """
  def move_north(%__MODULE__{north: north} = position) do
    %__MODULE__{position | north: north + 1}
  end

  @doc """
  Moves a Position` one space in the south direction.

  ## Examples

    iex> Position.move_south(%Position{north: 2})
    %Position{north: 1}
  """
  def move_south(%__MODULE__{north: north} = position) do
    %__MODULE__{position | north: north - 1}
  end

  @doc """
  Moves a Position` one space in the west direction.

  ## Examples

    iex> Position.move_west(%Position{east: -3})
    %Position{east: -4, west: 4}
  """
  def move_west(%__MODULE__{east: east} = position) do
    east = east - 1
    %__MODULE__{position | east: east, west: east * -1}
  end
end
