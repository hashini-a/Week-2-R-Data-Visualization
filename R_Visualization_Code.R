# Week 2 - Data Visualization and Insight Communication using R

# Load ggplot2
library(ggplot2)

# Load AirPassengers dataset
data("AirPassengers")

# Convert dataset into a data frame
air_df <- data.frame(
  Month = as.Date(time(AirPassengers)),
  Passengers = as.numeric(AirPassengers)
)

# Create Year and Month variables
air_df$Year <- as.integer(format(air_df$Month, "%Y"))
air_df$Month_Name <- format(air_df$Month, "%b")
air_df$Month_Number <- as.integer(format(air_df$Month, "%m"))


# 1. Line Chart
ggplot(air_df, aes(x = Month, y = Passengers)) +
  geom_line() +
  labs(
    title = "Monthly Airline Passengers (1949-1960)",
    x = "Year",
    y = "Passengers (thousands)"
  ) +
  theme_minimal()


# 2. Bar Chart
annual <- aggregate(Passengers ~ Year, data = air_df, sum)

ggplot(annual, aes(x = factor(Year), y = Passengers)) +
  geom_col() +
  labs(
    title = "Total Airline Passengers by Year",
    x = "Year",
    y = "Annual Passengers (thousands)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# 3. Histogram
ggplot(air_df, aes(x = Passengers)) +
  geom_histogram(bins = 12, color = "black") +
  labs(
    title = "Distribution of Monthly Passenger Counts",
    x = "Passengers (thousands)",
    y = "Number of Months"
  ) +
  theme_minimal()


# 4. Scatter Plot
ggplot(annual, aes(x = Year, y = Passengers)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Year vs Annual Passenger Total",
    x = "Year",
    y = "Annual Passengers (thousands)"
  ) +
  theme_minimal()


# 5. Box Plot
ggplot(air_df, aes(x = factor(Month_Number), y = Passengers)) +
  geom_boxplot() +
  labs(
    title = "Monthly Passenger Distribution by Calendar Month",
    x = "Month Number",
    y = "Passengers (thousands)"
  ) +
  theme_minimal()
