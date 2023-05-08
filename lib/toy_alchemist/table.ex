defmodule ToyAlchemist.Table do
  defstruct [:north_boundary, :east_boundary]

  def new(north_boundary, east_boundary) do
    struct!(__MODULE__, north_boundary: north_boundary, east_boundary: east_boundary)
  end

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
