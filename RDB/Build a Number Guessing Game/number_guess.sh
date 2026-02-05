#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER=$(( ($RANDOM % 1000) + 1 ))
GUESS_COUNT=0
VICTORY=0

echo Enter your username:
read USER
BEST=$($PSQL "SELECT best FROM users WHERE username = '$USER'")
if [[ -z $BEST ]]
then
  NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USER')")
  BEST=0
  GAMES=0
  echo Welcome, $USER! It looks like this is your first time here.
else
  GAMES=$($PSQL "SELECT games FROM users WHERE username = '$USER'")
  echo Welcome back, $USER! You have played $GAMES games, and your best game took $BEST guesses.
fi

echo Guess the secret number between 1 and 1000:

while [[ $VICTORY -eq 0 ]]
do
  read INPUT
  GUESS_COUNT=$(( $GUESS_COUNT + 1 ))
  if [[ -z $(echo $INPUT | grep [0-9]) ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $INPUT -gt $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $INPUT -lt $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    VICTORY=1
  fi
done


if [[ $GUESS_COUNT -lt $BEST || $BEST -eq 0 ]]
then
  UPDATE_BEST=$($PSQL "UPDATE users SET best = $GUESS_COUNT WHERE username = '$USER'")
fi
GAMES=$(( $GAMES + 1 ))
UPDATE=$($PSQL "UPDATE users SET games = $GAMES WHERE username = '$USER'")
echo You guessed it in $GUESS_COUNT tries. The secret number was $NUMBER. Nice job!
