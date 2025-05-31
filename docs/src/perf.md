# Performance

Here is a benchmark showcasing the performance of TexasHoldem:

```@example
import TexasHoldem as TH
using TexasHoldem
using BenchmarkTools
import Logging
import Random
Random.seed!(1234)

players() = ntuple(i->(Player(TH.FuzzBot(), i)), 4)

function do_work!()
    play(Game(players(); gui = TH.PlainLogger(), logger=TH.ByPassLogger()))
    return nothing
end

trial = @benchmark do_work!()
show(stdout, MIME("text/plain"), trial)
nothing
```
