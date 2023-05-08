defmodule ToyAlchemist.Table do
  @moduledoc """
  Specifies the playing surface.
  """

  defstruct [:north_boundary, :east_boundary]

  @doc """
  Populates a new `Table` struct with the specified attributes

  ## Examples

    iex> Table.new(3, 4)
    %Table{east_boundary: 4, north_boundary: 3}
  """
  def new(north_boundary, east_boundary) do
    struct!(__MODULE__, north_boundary: north_boundary, east_boundary: east_boundary)
  end

  @doc """
  Returns true if the position specified is within the boundaries of the `Table`.

  ## Examples

    iex> Table.valid_position?(%Table{east_boundary: 4, north_boundary: 3}, 2, 2)
    true
  """
  def valid_position?(
        %__MODULE__{north_boundary: north_boundary, east_boundary: east_boundary},
        north_position,
        east_position
      ) do
    within_boundary?(north_boundary, north_position) &&
      within_boundary?(east_boundary, east_position)
  end

  defp within_boundary?(boundary, position), do: 0..boundary |> Enum.member?(position)
end
