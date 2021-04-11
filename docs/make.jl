using Documenter, NoLimitHoldem

format = Documenter.HTML(
    prettyurls = !isempty(get(ENV, "CI", "")),
    collapselevel = 1,
)

makedocs(
    sitename = "NoLimitHoldem.jl",
    strict = true,
    format = format,
    checkdocs = :exports,
    clean = true,
    doctest = true,
    modules = [NoLimitHoldem],
    pages = Any[
        "Home" => "index.md",
        "API" => "api.md",
    ],
)

deploydocs(
    repo = "github.com/charleskawczynski/NoLimitHoldem.jl.git",
    target = "build",
    push_preview = true,
    devbranch = "main",
    forcepush = true,
)
