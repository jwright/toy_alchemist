defmodule ToyAlchemist.Alchemist do
  defstruct [:position]

  def new(position \\ 0) do
    struct!(ToyAlchemist.Alchemist, position: position)
  end
end
