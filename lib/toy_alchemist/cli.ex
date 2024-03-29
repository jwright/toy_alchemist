defmodule ToyAlchemist.CLI do
  @moduledoc """
  A command line interface to process a list of potions.
  """

  alias ToyAlchemist.{Sorcerer, Wizard}

  @doc """
  The main entry point for the `alchemist` script.

  ## Examples

    iex> ToyAlchemist.CLI.main(["potions.txt"])
    %ToyAlchemist.Simulation{alchemist: ToyAlchemist.Alchemist{}}
  """
  def main(args) do
    args
    |> parse_args
    |> perform()
  end

  def perform(nil), do: report_usage()

  @doc """
  Processes all of the potions specified in the file at the provided path.

  ## Examples

    iex> ToyAlchemist.CLI.perform("potions.txt")
    %ToyAlchemist.Simulation{alchemist: ToyAlchemist.Alchemist{}}
  """
  def perform(potion_file_path) do
    if File.exists?(potion_file_path) do
      File.stream!(potion_file_path)
      |> prepare_potions()
      |> perform_potions()
    else
      report_missing_file_path(potion_file_path)
    end
  end

  defp parse_args(args) do
    {_, arguments, _} =
      args
      |> OptionParser.parse(switches: [])

    arguments |> List.first()
  end

  defp perform_potions(potions) do
    potions
    |> Sorcerer.interpret()
    |> Wizard.cast_spell()
  end

  defp prepare_potions(potions), do: potions |> Enum.map(&prepare_potion/1)

  defp prepare_potion(potion), do: potion |> String.trim()

  defp report_missing_file_path(file_path),
    do: IO.puts("Unable to perform wizardly things on `#{file_path}`. The file was not found.")

  defp report_usage,
    do:
      IO.puts("""
      Usage: alchemist [FILE_PATH]

      Example: alchemist potions.txt
      """)
end
