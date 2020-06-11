generated quantities {
	real lambda = normal_rng(692,200);
	int deaths = poisson_rng(lambda);
}
