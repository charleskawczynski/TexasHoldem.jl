using SafeTestsets

@safetestset "players" begin
    Δt = @elapsed include("players.jl"); @info "Completed tests for players in $Δt seconds"
end
@safetestset "transactions" begin
    Δt = @elapsed include("transactions.jl"); @info "Completed tests for transactions in $Δt seconds"
end
@safetestset "call_raise_validation" begin
    Δt = @elapsed include("call_raise_validation.jl"); @info "Completed tests for call_raise_validation in $Δt seconds"
end
@safetestset "human_player_option" begin
    Δt = @elapsed include("human_player_option.jl"); @info "Completed tests for human_player_option in $Δt seconds"
end
@safetestset "table" begin
    Δt = @elapsed include("table.jl"); @info "Completed tests for table in $Δt seconds"
end
@safetestset "game" begin
    Δt = @elapsed include("game.jl"); @info "Completed tests for game in $Δt seconds"
end
@safetestset "play" begin
    Δt = @elapsed include("play.jl"); @info "Completed tests for play in $Δt seconds"
end
@safetestset "fuzz_play" begin
    Δt = @elapsed include("fuzz_play.jl"); @info "Completed tests for fuzz_play in $Δt seconds"
end
@safetestset "reproducibility" begin
    Δt = @elapsed include("reproducibility.jl"); @info "Completed tests for reproducibility in $Δt seconds"
end
