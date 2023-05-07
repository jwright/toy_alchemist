defmodule ToyAlchemist.Alchemist do
  defstruct [:facing, :position]

  alias ToyAlchemist.Position

  def new(north \\ 0, east \\ 0, opts \\ []) do
    facing = Keyword.get(opts, :facing, :north)

    struct!(__MODULE__, facing: facing, position: Position.new(north, east))
  end
end
