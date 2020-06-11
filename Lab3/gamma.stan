data {
    real<lower=0> alpha; // Shape
    real<lower=0> beta; // Inverse scale
}

parameters {
    real y;
}

model {
    y ~ gamma(alpha, beta);
}