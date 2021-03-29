for submodule in [
                  "test_card_eval_helpers",
                  "CardEval",
                  "Hand",
                  "Game",
                 ]

  println("Starting tests for $submodule")
  t = @elapsed include(submodule*".jl")
  println("Completed tests for $submodule, $(round(Int, t)) seconds elapsed")
end
