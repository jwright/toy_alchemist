defmodule ToyAlchemist do
  @moduledoc """
  Documentation for `ToyAlchemist`.
  """

  alias ToyAlchemist.Alchemist

  def move(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: position + 1}
  end
end
