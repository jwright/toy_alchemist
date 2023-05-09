defmodule ToyAlchemist.PotionInterpreterTest do
  use ExUnit.Case

  alias ToyAlchemist.PotionInterpreter

  describe "interpret/1" do
    test "with a MOVE potion, returns a move tuple" do
      assert PotionInterpreter.interpret(["MOVE"]) == [{:move}]
    end

    test "with a LEFT potion, returns a turn left tuple" do
      assert PotionInterpreter.interpret(["LEFT"]) == [{:turn_left}]
    end

    test "with a RIGHT potion, returns a turn right tuple" do
      assert PotionInterpreter.interpret(["RIGHT"]) == [{:turn_right}]
    end

    test "with a REPORT potion, returns a report tuple" do
      assert PotionInterpreter.interpret(["REPORT"]) == [{:report}]
    end

    test "with a PLACE potion, returns a place tuple with parameters" do
      assert PotionInterpreter.interpret(["PLACE 1,2,NORTH"]) == [
               {:place, [north: 1, east: 2, facing: :north]}
             ]
    end

    test "with a PLACE potion with invalid arguments, returns an invalid tuple" do
      potion = "PLACE 8,-,EAST"

      assert PotionInterpreter.interpret([potion]) == [{:invalid, potion}]
    end

    test "with an invalid potion, returns an invalid tuple" do
      assert PotionInterpreter.interpret(["BLAH"]) == [{:invalid, "BLAH"}]
    end

    test "interprets several potions" do
      potions = [
        "PLACE 1,3,EAST",
        "MOVE",
        "BLAH",
        "REPORT"
      ]

      assert PotionInterpreter.interpret(potions) == [
               {:place, [north: 1, east: 3, facing: :east]},
               {:move},
               {:invalid, "BLAH"},
               {:report}
             ]
    end
  end
end
