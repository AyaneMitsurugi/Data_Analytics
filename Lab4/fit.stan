data {
	int N; //Number of samples
	int deaths[N]; //Deaths per year
}

parameters {
	real<lower=0> lambda;
}

model {
	lambda ~ normal(692,200);
	deaths ~ poisson(lambda);
}

generated quantities {
	int death = poisson_rng(lambda);
}
