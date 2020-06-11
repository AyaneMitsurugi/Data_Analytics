data {
    real<lower=0> alpha; // Shape
    real<lower=0> beta; // Inverse scale
}

parameters {
    real y;
}

model {
    y ~ inv_gamma(alpha, beta);
}