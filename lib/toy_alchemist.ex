defmodule ToyAlchemist do
  @moduledoc """
  Performs the commands on the `Alchemist` and keeps track of them on the Elixir Table.
  """

  alias ToyAlchemist.{Alchemist, Position}

  @doc """
  Moves an `Alchemist` one space in the direction the alchemist is currently facing.

  ## Examples

    iex> ToyAlchemist.move(%Alchemist{position: %Position{east: 1}, facing: :east})
    %Alchemist{position: %Position{east: 2}}
  """
  def move(%Alchemist{facing: facing} = alchemist) do
    case facing do
      :north -> alchemist |> move_north()
      :east -> alchemist |> move_east()
      :south -> alchemist |> move_south()
      :west -> alchemist |> move_west()
      _ -> alchemist
    end
  end

  def turn_left(%Alchemist{facing: facing} = alchemist) do
    case facing do
      :north -> %Alchemist{alchemist | facing: :west}
      :east -> %Alchemist{alchemist | facing: :north}
      :south -> %Alchemist{alchemist | facing: :east}
      :west -> %Alchemist{alchemist | facing: :south}
      _ -> alchemist
    end
  end

  def turn_right(%Alchemist{facing: facing} = alchemist) do
    case facing do
      :north -> %Alchemist{alchemist | facing: :east}
      :east -> %Alchemist{alchemist | facing: :south}
      :south -> %Alchemist{alchemist | facing: :west}
      :west -> %Alchemist{alchemist | facing: :north}
      _ -> alchemist
    end
  end

  defp move_east(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: Position.move_east(position)}
  end

  defp move_north(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: Position.move_north(position)}
  end

  defp move_south(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: Position.move_south(position)}
  end

  defp move_west(%Alchemist{position: position} = alchemist) do
    %Alchemist{alchemist | position: Position.move_west(position)}
  end
end
