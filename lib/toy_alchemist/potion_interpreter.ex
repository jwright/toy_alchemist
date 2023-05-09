defmodule ToyAlchemist.PotionInterpreter do
  def interpret(potions), do: potions |> Enum.map(&interpret_potion/1)

  defp interpret_potion("LEFT"), do: {:turn_left}
  defp interpret_potion("MOVE"), do: {:move}
  defp interpret_potion("PLACE " <> args), do: {:place, interpret_potion_arguments(:place, args)}
  defp interpret_potion("REPORT"), do: {:report}
  defp interpret_potion("RIGHT"), do: {:turn_right}

  defp interpret_potion_arguments(:place, args) do
    arguments =
      ~r/^(?<north>\d+),(?<east>\d+),(?<facing>NORTH|EAST|SOUTH|WEST)$/
      |> Regex.named_captures(args)

    [
      north: arguments["north"] |> String.to_integer(),
      east: arguments["east"] |> String.to_integer(),
      facing: arguments["facing"] |> String.downcase() |> String.to_atom()
    ]
  end
end
