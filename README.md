Project Setup:

- Created a number_guessing_game directory within the project folder.
- Developed the main script *number_guess.sh* inside the number_guessing_game directory and assigned executable permissions.

Script Development:

- Added a shebang #!/bin/bash at the top of number_guess.sh to ensure the script runs in a Bash environment.
- Implemented functionality to randomly generate a secret number that the user has to guess.

User Interaction:

- The script prompts the user for their username with "Enter your username:". It accommodates usernames up to 22 characters.
- If the username exists in the database, the script prints "Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses."
- If the username is new, it prints Welcome, <username>! It looks like this is your first time here.

Gameplay:

- The user is prompted to "Guess the secret number between 1 and 1000:". The script provides feedback after each guess, indicating whether the secret number is higher or lower.
- If the user enters a non-integer, the script responds with "That is not an integer, guess again:".
- Upon correctly guessing the secret number, the script congratulates the user with "You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!".
