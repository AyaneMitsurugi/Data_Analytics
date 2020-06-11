data {
	int N;
	real Miles[N];
}

generated quantities {
	real beta = beta_rng(2,10);
	int deaths[N];
	for(i in 1:N) {
		deaths[i] = poisson_rng(Miles[i]*beta);
	}
}
