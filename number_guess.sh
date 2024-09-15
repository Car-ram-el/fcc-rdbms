#!/bin/bash

p="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

ran=$(( $(( $RANDOM % 1000 )) + 1))

main() {
  echo Enter your username:
  read name

  # if exists, show some stats else add
  user=$($p "select name from users where name = '$name'")

  if [[ -z $user ]]
  then
    x=$($p "insert into users (name) values ('$name')")
    echo Welcome, $name! It looks like this is your first time here.
  else
    echo Welcome back, $user! You have played $($p "select games from users where name = '$user'") games, and your best game took $($p "select best from users where name = '$user'") guesses.
  fi

  echo Guess the secret number between 1 and 1000:
  read guess
  # guesses
  i=1

  while [[ $guess != $ran ]]
  do
    # not a number
    if [[ ! $guess =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read guess
      continue
    fi

    # conditions 
    if (( $guess > $ran ))
    then
      echo "It's lower than that, guess again:"
      read guess
    elif (( $guess < $ran ))
    then
      echo "It's higher than that, guess again:"
      read guess
    fi

    (( i++ ))
  done

  echo You guessed it in $i tries. The secret number was $ran. Nice job!

  # update db
  up=$($p "UPDATE users
  SET games = games + 1,
      best = CASE
        WHEN $i < best THEN $i
      END
  WHERE name = '$name';")
}

main
