defmodule ToyAlchemist.Sorcerer do
  @moduledoc """
  Interprets a list of text based potions.
  """

  @doc """
  Enumerates through a list of text based potions and converts them into Wizardry instructions.

  ## Examples

    iex> Sorcerer.interpret(["PLACE 0,3,SOUTH", "MOVE", "REPORT"])
    [{:place, [north: 0, east: 3, facing: :south]}, {:move}, {:report}]
  """
  def interpret(potions), do: potions |> Enum.map(&interpret_potion/1)

  defp interpret_potion("LEFT"), do: {:turn_left}
  defp interpret_potion("MOVE"), do: {:move}

  defp interpret_potion("PLACE " <> args = potion) do
    case interpret_potion_arguments(:place, args) do
      :invalid_arguments -> {:invalid, potion}
      arguments -> {:place, arguments}
    end
  end

  defp interpret_potion("REPORT"), do: {:report}
  defp interpret_potion("RIGHT"), do: {:turn_right}

  defp interpret_potion(invalid_potion),
    do: {:invalid, interpret_potion_arguments(:invalid, invalid_potion)}

  defp interpret_potion_arguments(:invalid, args), do: args

  defp interpret_potion_arguments(:place, args) do
    ~r/^(?<north>\d+),(?<east>\d+),(?<facing>NORTH|EAST|SOUTH|WEST)$/
    |> Regex.named_captures(args)
    |> parse_potion_arguments(:place)
  end

  defp parse_potion_arguments(nil, _potion), do: :invalid_arguments

  defp parse_potion_arguments(args, :place) do
    [
      north: args["north"] |> String.to_integer(),
      east: args["east"] |> String.to_integer(),
      facing: args["facing"] |> String.downcase() |> String.to_atom()
    ]
  end
end
