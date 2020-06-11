functions {
  vector tail_delta(vector y,       //unknowns
                    vector theta,   //parameters
                    real[] x_r,     // data(real)
                    int[] x_i) {    //data(integer)
    vector[2] deltas;
    // At the end we will receive distribution from 5 to 10 with 98% probability
    deltas[1] = gamma_cdf(theta[1], y[1], y[2]) - 0.99;
    deltas[2] = gamma_cdf(theta[2], y[1], y[2]) - 0.01;
    return deltas;
  }
}

data {
  vector<lower=0>[2] y_guess; // Initial guess of Gaussian standard deviation
  vector<lower=0>[2] theta;   // Target quantile
}

transformed data {
  vector[2] y;
  real x_r[0];
  int x_i[0];

  // Find gamma parameters that ensures 98% probabilty from 5 to 10
  y = algebra_solver(tail_delta, y_guess, theta, x_r, x_i, 1e-10, 1e-3, 1e3); // last 3 parameters are tolerances, middle one was changed due to occuring error, not recomended solution but it works

  print("Alpha  = ", y[1]);
  print("Beta = ", y[2]);
}

generated quantities {
  real alpha = y[1];
  real beta = y[2];
}