data {
    vector[2] mu; //location vector
    matrix[2,2] Sigma; //covariance matrix
}

parameters {
    vector[2] y;
}

model {
    y ~ multi_normal(mu, Sigma);
}