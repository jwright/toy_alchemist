defmodule ToyAlchemist.Position do
  defstruct [:north, :east]

  def new(north, east) do
    struct!(__MODULE__, %{north: north, east: east})
  end
end
