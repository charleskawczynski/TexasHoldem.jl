using Documenter, TexasHoldem

format = Documenter.HTML(
    prettyurls = !isempty(get(ENV, "CI", "")),
    collapselevel = 1,
)

makedocs(
    sitename = "TexasHoldem.jl",
    strict = true,
    format = format,
    checkdocs = :exports,
    clean = true,
    doctest = true,
    modules = [TexasHoldem],
    pages = Any[
        "Home" => "index.md",
        "API" => "api.md",
    ],
)

deploydocs(
    repo = "github.com/charleskawczynski/TexasHoldem.jl.git",
    target = "build",
    push_preview = true,
    devbranch = "main",
    forcepush = true,
)
