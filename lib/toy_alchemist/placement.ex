defmodule ToyAlchemist.Placement do
  defstruct [:north, :east, :facing]

  def new(north \\ 0, east \\ 0, facing \\ :north) do
    struct!(__MODULE__, north: north, east: east, facing: facing)
  end
end
