defmodule ToyAlchemist.Placement do
  @moduledoc """
  Represents a location and a facing direction.
  """

  defstruct [:north, :east, :facing]

  @doc """
  Populates a new `Placement` struct with the specified attributes

  ## Examples

    iex> Placement.new(3, 4)
    %Placement{north: 3, east: 4, facing: :north}
  """
  def new(north \\ 0, east \\ 0, facing \\ :north) do
    struct!(__MODULE__, north: north, east: east, facing: facing)
  end

  @doc """
  Populates a new `Placement` struct with the specified attributes in a Map.

  ## Examples

    iex> Placement.from_map(%{north: 3, east: 4})
    %Placement{north: 3, east: 4, facing: :north}
  """
  def from_map(attrs), do: struct!(__MODULE__, attrs)
end
