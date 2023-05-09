defmodule ToyAlchemist.TableTest do
  use ExUnit.Case

  alias ToyAlchemist.Table

  doctest Table

  describe "valid_position?/2" do
    setup do
      [table: Table.new(4, 4)]
    end

    test "returns true when the position is within the table boundaries", %{table: table} do
      assert Table.valid_position?(table, %{north: 2, east: 3})
    end

    test "returns false when the position is below the boundary", %{table: table} do
      refute Table.valid_position?(table, %{north: 2, east: -1})
    end

    test "returns false when the position is above the boundary", %{table: table} do
      refute Table.valid_position?(table, %{north: 5, east: 3})
    end
  end
end
