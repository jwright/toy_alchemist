defmodule ToyAlchemist.Alchemist do
  defstruct [:position]

  alias ToyAlchemist.Position

  def new(north \\ 0, east \\ 0) do
    struct!(__MODULE__, position: Position.new(north, east))
  end
end
