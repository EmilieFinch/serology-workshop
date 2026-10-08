# Generate simulated datasets

library(tidyverse)
library(qs)
devtools::install_github("nathoze/Rsero")
library(Rsero)

data_constant <- simulate_SeroData(foi = rep(0.05,65),
                  sampling_year = 2024,
                  epidemic_year = seq(1960,2024),
                  number_samples = 1000)

data_peak2 <- simulate_SeroData(foi = c(0.5, 0.1),
                                   sampling_year = 2024,
                                   epidemic_year = c(1982,2014),
                                   number_samples = 1000)

for (sero_data in list(data_constant, data_peak2)) {
    output <- data.frame(
        participant_id = seq_len(sero_data$N),
        age = sero_data$age,
        serostatus = sero_data$Y
    )

    output_name <- if (identical(sero_data, data_constant)) {
        "data/simulated-data1.csv"
    } else {
        "data/simulated-data2.csv"
    }

    write.csv(output, output_name, row.names = FALSE)
}



