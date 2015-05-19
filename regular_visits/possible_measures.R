set.seed(47)
source("regular_visits/generate_tests.R")
# creates list of data called test_cases
# each element is a vector of durations between visits

# each approach should define a function that takes a vector
# and returns a single number, a metric of regularity...
# potentially, it could then combine the metrics for each list element,
# weighting by length, to give an overall provider measure

var_diff = function(t) {
  var(t - mean(t))
}

sapply(test_cases, var_diff)

var_diff_trim = function(t) {
  bounds = quantile(t, probs = c(0.025, 0.975))
  t_trim = t[t >= bounds[1] & t <= bounds[2]]
  var(t_trim - mean(t_trim))
}

sapply(test_cases, var_diff_trim)
