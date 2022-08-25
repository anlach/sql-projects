#!/bin/bash

db="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN () {

  echo "Enter your username:"
  read -p "> " USERNAME

  NUM_VISITS=$($db "select visits from users where name='$USERNAME'")

  if [[ ! $NUM_VISITS =~ ^[0-9]+$ ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else
    BEST_GUESSES=$($db "select best_guesses from users where name='$USERNAME'")
    echo -e "\nWelcome back, $USERNAME! You have played $NUM_VISITS games, and your best game took $BEST_GUESSES guesses."
  fi

  SECRET_NUMBER=$(( $RANDOM % 1000 + 1))

  echo "Guess the secret number between 1 and 1000:"
  read -p "> " GUESS
  CHECK_GUESS

  NUM_GUESSES=1
  while [[ $GUESS -ne $SECRET_NUMBER ]]
  do
    if [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
    read -p "> " GUESS
    CHECK_GUESS
    (( NUM_GUESSES++ ))
  done

  echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  (( NUM_VISITS++ ))
  if [[ -z $BEST_GUESSES ]]
  then
    RESULT=$($db "insert into users(name, best_guesses) values('$USERNAME', $NUM_GUESSES)")
  else
    if [[ $NUM_GUESSES -lt $BEST_GUESSES ]]
    then
      RESULT=$($db "update users set best_guesses=$NUM_GUESSES, visits=$NUM_VISITS where name='$USERNAME'")
    else
      RESULT=$($db "update users set visits=$NUM_VISITS where name='$USERNAME'")
    fi
  fi

}

CHECK_GUESS () {

  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read -p "> " GUESS
  done

}

MAIN