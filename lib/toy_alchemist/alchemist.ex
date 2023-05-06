defmodule ToyAlchemist.Alchemist do
  defstruct [:position]

  def new(east \\ 0) do
    struct!(__MODULE__, position: %{east: east})
  end
end
