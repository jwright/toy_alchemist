defmodule ToyAlchemist.CLITest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ToyAlchemist.CLI

  describe "perform/1" do
    setup do
      valid_file_path = Path.expand("test/fixtures/potions.txt", File.cwd!())

      [valid_file_path: valid_file_path]
    end

    test "with a valid potion file performs the spell", %{valid_file_path: valid_file_path} do
      actual =
        capture_io(fn ->
          CLI.perform(valid_file_path)
        end)

      expected = """
      The alchemist is at (4, 1) and facing WEST
      """

      assert String.trim(actual) == String.trim(expected)
    end

    test "with a valid potion file returns the simulation", %{valid_file_path: valid_file_path} do
      capture_io(fn ->
        assert %ToyAlchemist.Simulation{} = CLI.perform(valid_file_path)
      end)
    end

    test "with no parameter displays the usage" do
      assert capture_io(fn ->
               CLI.perform()
             end) ==
               """
               Usage: alchemist [FILE_PATH]

               Example: alchemist potions.txt

               """
    end

    test "displays an error if the file does not exist" do
      assert capture_io(fn ->
               CLI.perform("blah/no-magic-detected.txt")
             end) ==
               "Unable to perform wizardly things on `blah/no-magic-detected.txt`. The file was not found.\n"
    end
  end
end
