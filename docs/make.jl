using Documenter, TexasHoldem

format = Documenter.HTML(
    prettyurls = !isempty(get(ENV, "CI", "")),
    collapselevel = 1,
)

makedocs(
    sitename = "TexasHoldem.jl",
    format = format,
    checkdocs = :exports,
    clean = true,
    doctest = true,
    modules = [TexasHoldem],
    pages = Any[
        "Home" => "index.md",
        "Installation" => "installation.md",
        "Quick-start" => "quickstart.md",
        "Terminology" => "terminology.md",
        "Performance" => "perf.md",
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
