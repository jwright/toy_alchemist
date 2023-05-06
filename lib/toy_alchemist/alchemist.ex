defmodule ToyAlchemist.Alchemist do
  defstruct [:position]

  def new(position \\ 0) do
    struct!(__MODULE__, position: position)
  end
end
