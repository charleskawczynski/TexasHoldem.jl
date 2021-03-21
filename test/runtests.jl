for submodule in [
                  "Card",
                  "Hand",
                  "Deck",
                  "Game",
                 ]

  println("Starting tests for $submodule")
  t = @elapsed include(submodule*".jl")
  println("Completed tests for $submodule, $(round(Int, t)) seconds elapsed")
end
