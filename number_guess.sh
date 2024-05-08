#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

CLEAN_TABLE=$($PSQL "DELETE FROM users WHERE user_name LIKE 'user%'")

echo -e "Enter your username:"
read USERNAME

#check user info
USER_ID=$($PSQL "SELECT user_name FROM users WHERE user_name = '$USERNAME'")

if [[ -z $USER_ID ]]

  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."


  else

  	GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users WHERE user_name = '$USERNAME'")

    BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM users WHERE user_name = '$USERNAME'")

  	echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

fi

N=$((1 + RANDOM % 1000))

GAME_START() {
	

	echo -e "\nGuess the secret number between 1 and 1000:"
    read NUMBER 
    
    NUMBER_OF_GUESSES=0

    while true

      do

        ((NUMBER_OF_GUESSES++))

        #if it is not a number
        while ! [[ $NUMBER =~ ^[0-9]+$ ]]
          do
          echo "That is not an integer, guess again:"
          read NUMBER
          done

        #if number guessed is greater than secret number $N, then ask user to key in a lower number 
        if [[ $NUMBER -gt $N ]]
          then
          echo "It's lower than that, guess again:"
        
        #if number guessed is lower than secret number $N, then ask user to key in a higher number 
        elif [[ $NUMBER -lt $N ]]
          then
          echo "It's higher than that, guess again:"

        #if number guessed is same as secret number
        else
          echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $N. Nice job!"
          break #exit the loop once number is guessed correctly

        fi  

        read NUMBER
        
        
        
      done

    #insert into table users
  	USER_GAME_RESULT=$($PSQL "INSERT INTO users(user_name, number_of_guesses) VALUES('$USERNAME', $NUMBER_OF_GUESSES)")

}

GAME_START

