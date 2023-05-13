defmodule ToyAlchemist.CLI do
  alias ToyAlchemist.{Sorcerer, Wizard}

  def perform(potion_file_path) do
    File.stream!(potion_file_path)
    |> prepare_potions()
    |> perform_potions()
  end

  defp perform_potions(potions) do
    potions
    |> Sorcerer.interpret()
    |> Wizard.cast_spell()
  end

  defp prepare_potions(potions), do: potions |> Enum.map(&prepare_potion/1)

  defp prepare_potion(potion), do: potion |> String.trim()
end
