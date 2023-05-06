defmodule ToyAlchemist.Alchemist do
  defstruct [:position]

  def new(north \\ 0, east \\ 0) do
    struct!(__MODULE__, position: %{north: north, east: east})
  end
end
