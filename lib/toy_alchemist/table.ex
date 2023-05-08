defmodule ToyAlchemist.Table do
  defstruct [:north_boundary, :east_boundary]

  def new(north_boundary, east_boundary) do
    struct!(__MODULE__, north_boundary: north_boundary, east_boundary: east_boundary)
  end
end
