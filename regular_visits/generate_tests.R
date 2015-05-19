
perturb = function(t, n_misses = 1, n_adjusts = 1) {
    misses = sample(2:(length(t) - 1), size = n_misses, replace = F)
    t[misses] = t[misses] + t[misses + 1]
    t = t[-(misses + 1)]
    adjusts = sample(2:(length(t) - 1), size = n_adjusts, replace = F)
    t[adjusts] = t[adjusts] + 1
    t[adjusts + 1] = t[adjusts + 1] - 1
    return(t)
}

test_cases = list()

test_cases$everyday_sametime = rep(24, 30)
test_cases$mon_fri = rep(c(96, 72), 10)
test_cases$mon_tue_fri = rep(c(24, 72, 72), 10)

perturbations = lapply(test_cases, perturb)
names(perturbations) = paste(names(test_cases), "perturb", sep = "_")

big_perturb = lapply(test_cases, perturb, n_misses = 4, n_adjusts = 5)
names(big_perturb) = paste(names(test_cases), "vperturb", sep = "_")

test_cases = c(test_cases, perturbations, big_perturb)
