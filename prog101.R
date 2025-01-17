##########################################################################
## Driver: (Name) (GitHub Handle)                                       ##
## Navigator: (Name) (GitHub Handle)                                    ##
## Date: (YYYY-MM-DD)                                                   ##
##########################################################################

library(marinecs100b)
#testing 123
# Guiding questions -------------------------------------------------------

# What does KEFJ stand for?
#KEFJ stands for Kenai Fjords

#How was temperature monitored? Temperature is monitored by HOBO V2 temperature
#loggers placed below the mean lower low tide. They collect water temperature
#data every 20, 30, or 60 minutes.

# What's the difference between absolute temperature and temperature anomaly?
#Absolute Temperature is the actual temperature recorded, and anomaly temperature
#is the difference based on seasonal averages over time.


# Begin exploring ---------------------------------------------------------

# How many kefj_* vectors are there?
#There are 6 vectors


# How long are they?
#Combined, they are 2187966

# What do they represent?
#The vectors represent temperature, site, date, tide, exposure

# Link to sketch

datetimeshift <- kefj_datetime[-1] - kefj_datetime[]
table(datetimeshift)


Harris_datetime <- kefj_datetime[kefj_site == "Harris"]
common_interval <- Harris_datetime[-1] - Harris_datetime[-length(Harris_datetime)]
table(common_interval)


# Problem decomposition ---------------------------------------------------

# When and where did the hottest and coldest air temperature readings happen
plot_kefj(kefj_datetime[kefj_site == "Harris"], kefj_temperature[kefj_site == "Harris"], kefj_exposure[kefj_site == "Harris"])
# Link to sketch

# Plot the hottest day
# Get the hottest day, temperature, and site
# Convert day start and end time to date objects
# Find values from that site that are between start and end times
#
hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 00:00:00 -08", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-04 00:00:00 -08", tz = "Etc/GMT+8")
hotday_idx <- kefj_site == hottest_site & kefj_datetime >= hotday_start & kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)


# Repeat for the coldest day

coldest_idx <- which.min(kefj_temperature)
coldest_time <- kefj_datetime[coldest_idx]
coldest_site <- kefj_site[coldest_idx]
print(coldest_site)
print(coldest_time)
coldday_start <- as.POSIXct("2013-01-27 0:00:00 -08", tz = "Etc/GMT+8")
coldday_end <- as.POSIXct("2013-01-28 0:00:00 -08", tz = "Etc/GMT+8")
coldday_idx <- kefj_site == coldest_site & kefj_datetime >= coldday_start & kefj_datetime <= coldday_end
coldday_datetime <- kefj_datetime[coldday_idx]
coldday_temperature <- kefj_temperature[coldday_idx]
coldday_exposure <- kefj_exposure[coldday_idx]
plot_kefj(coldday_datetime, coldday_temperature, coldday_exposure)

# What patterns do you notice in time, temperature, and exposure? Do those
# patterns match your intuition, or do they differ?
#It makes sense that the hottest times would be in the air, since air temperatures change much faster than water.

# How did Traiger et al. define extreme temperature exposure?

# Translate their written description to code and calculate the extreme heat
# exposure for the hottest day.

# Compare your answer to the visualization you made. Does it look right to you?

# Repeat this process for extreme cold exposure on the coldest day.


# Putting it together -----------------------------------------------------

# Link to sketch

# Pick one site and one season. What were the extreme heat and cold exposure at
# that site in that season?

# Repeat for a different site and a different season.

# Optional extension: Traiger et al. (2022) also calculated water temperature
# anomalies. Consider how you could do that. Make a sketch showing which vectors
# you would need and how you would use them. Write code to get the temperature
# anomalies for one site in one season in one year.
