-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013
local warningSent = false

ProbablyEngine.timer.register("lag", function()
  bandwidthIn, bandwidthOut, latencyHome, latencyWorld = GetNetStats()
  ProbablyEngine.lag = ((latencyWorld + latencyHome) / 2) / 1000
  if ProbablyEngine.lag > (ProbablyEngine.cycleTime / 1000) and warningSent == false then
    ProbablyEngine.print("Warning! World Latency of " .. latencyWorld .. "ms is greate than the update frequency")
    warningSent = true
  end
end, 2000)