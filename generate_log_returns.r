generate_log_returns <- function(file_name) {
	# read in the data from the csv file
  data <- read.csv(paste("./original_data/", file_name, ".csv", sep = ""))

	# convert the Price column to numeric format
	data$Price <- gsub(",", "", data$Price)
	data$Price <- as.numeric(data$Price)

	# print(data$Price[-1] - data$Price)
	a <- data$Price[-1]
	b <- data$Price[-length(data$Price)]
	print(log(b/a))

	# create a new column for log returns
	data$log_return <- c(log(data$Price[-length(data$Price)]/data$Price[-1]), 0)

	# write a new csm
  write.csv(data, paste("./log_returns/", file_name, "_log_returns.csv", sep = ""), row.names = FALSE)
}

generate_log_returns('dax')
