# Powerball Server

This is the server code for the ESP8266-based power and serial monitor, Powerball.

# Heroku

Powerball should run with almost no effort on Heroku's free plan.

## Limitations

Under [Heroku's free plan](https://www.heroku.com/free) you'll only be able to store 10,000 records in the database. If you're sampling 10 times per second that's 1000 seconds worth of data, or only about 15 minutes of data.

The server will also sleep when it goes idle and will have a delay when they wake up.

