generate_weighted_portfolio <- function() {
	# read in the data from the csv file
  dax_data <- read.csv("./log_returns/dax_log_returns.csv")
	snp_data <- read.csv("./log_returns/snp_500_log_returns.csv")

	# create a new data frame for the weighted portfolio
	weighted_portfolio <- data.frame(Date = dax_data$Date, weighted_log_return = 0.5 * dax_data$log_return + 0.5 * snp_data$log_return)

	# write a new csv
	write.csv(weighted_portfolio, "./log_returns/weighted_portfolio.csv", row.names = FALSE)
}

generate_weighted_portfolio()
