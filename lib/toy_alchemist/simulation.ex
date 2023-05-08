defmodule ToyAlchemist.Simulation do
  defstruct [:alchemist]

  alias ToyAlchemist.{Alchemist, Placement, Table}

  def place(%Table{} = table, %Placement{north: north, east: east, facing: facing}) do
    alchemist = Alchemist.new(north, east, facing: facing)

    {:ok, new(alchemist)}
  end

  defp new(alchemist) do
    struct!(__MODULE__, alchemist: alchemist)
  end
end
