generate_var <- function() {
	# read in the data from the csv file
	weighted_portfolio <- read.csv("./log_returns/weighted_portfolio.csv")

	# calculate the distribution of the weighted log returns
	portfolio_mean <- mean(weighted_portfolio$weighted_log_return)
	portfolio_sd <- sd(weighted_portfolio$weighted_log_return)
	cat("Mean: ", portfolio_mean, "\n")
	cat("Standard Deviation: ", portfolio_sd, "\n")
	# calculate var
	var_99 <- - (qnorm(0.99) * portfolio_sd - portfolio_mean)
	var_95 <- - (qnorm(0.95) * portfolio_sd - portfolio_mean)

	# Print the VaR results
	cat("1-week VaR at 99% confidence level:", var_99, "\n")
	cat("1-week VaR at 95% confidence level:", var_95, "\n")

	# get dollar value of VaR returns
	dollar_value_99 <- var_99 * weighted_portfolio$total_price[1]
	dollar_value_95 <- var_95 * weighted_portfolio$total_price[1]
	
	cat("1-week VaR at 99% confidence level in dollars:", dollar_value_99, "\n")
	cat("1-week VaR at 95% confidence level in dollars:", dollar_value_95, "\n")

}

generate_var()