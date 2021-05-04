for submodule in [
                  "players",
                  "transactions",
                  "table",
                  "game",
                 ]

  println("Starting tests for $submodule")
  t = @elapsed include(submodule*".jl")
  println("Completed tests for $submodule, $(round(Int, t)) seconds elapsed")
end
