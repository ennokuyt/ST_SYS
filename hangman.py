import random

INPUT_PREFIX = ' > '

MAX_WORD_LENGTH = 20
STATIC_LIVES = 6
STATIC_WORDS = ['Software', 'Testing', 'Game', 'Hangman', 'ThisIsALongWord']
HANGMAN_PICS = ['''
     +---+
         |
         |
         |
        ===''', '''
     +---+
     O   |
         |
         |
        ===''', '''
    +---+
    O   |
    |   |
        |
       ===''', '''
    +---+
    O   |
   /|   |
        |
       ===''', '''
    +---+
    O   |
   /|\  |
        |
       ===''', '''
    +---+
    O   |
   /|\  |
   /    |
       ===''', '''
    +---+
    O   |
   /|\  |
   / \  |
       ===''']

def play_game(word):
    # word list easier to index/manipulate
    word_list = list(word)
    n = len(word_list)
    letters = set(word_list)

    guessed = set()
    guessed_list = ['_' for i in range(n)]

    lives = STATIC_LIVES

    while lives > 0:
        print(f'Guessing word with {n} characters: {"".join(guessed_list)}')
        print(f'Guessed letters: {" ".join(guessed)}')
        print(f'Lives left: {lives}')
        print(HANGMAN_PICS[STATIC_LIVES - lives])

        letter = input(INPUT_PREFIX)
        if len(letter) != 1:
            if len(letter) == n:
                if letter == word:
                    print('You guessed the word, congratulations!')
                    return
                else:
                    print('That is wrong, continue guessing letters or try another word')
                    lives -= 1
                    continue
            else:
                print(f'Please put in only one letter or {n} letters for a guess')
                continue

        elif not letter.isalpha():
            print('Please put in a letter a-z or A-Z')
            continue

        letter = letter.lower()

        if letter in guessed:
            print('You already guessed this, please select another letter')
            continue

        guessed.add(letter)

        if letter.lower() in letters:
            print('You got a hit!')
            for i in [i for i, ltr in enumerate(word_list) if ltr == letter]:
                guessed_list[i] = letter
            if '_' not in guessed_list:
                print(f'You win the game! The word was "{word}"')
                return
        else:
            print('That letter was not in the word, you lost a life')
            lives -= 1
    print(HANGMAN_PICS[STATIC_LIVES])
    print(f'Game over! The word was "{word}"')


print('Welcome to Hangman - A Testers Nightmare Expansion\n'
      'Enter "1" to put in a word for another person to guess\n'
      'Enter "2" to guess a random word from our library')

while True:
    cmd = input(INPUT_PREFIX)

    # Check valid input type
    if len(cmd) != 1:
        print('Unknown command, please try again')

    elif cmd == '1':
        print('What word would you like another person to guess?')

        while True:
            word = input(INPUT_PREFIX)
            if not word.isalpha():
                print('The word is not properly written, it should only contain the characters a-z or A-Z')

            elif len(word) > MAX_WORD_LENGTH:
                print(f'The word is too long, Please provide a word with at most {MAX_WORD_LENGTH} characters')

            else:
                print('Word accepted')
                break

        play_game(word.lower())

    elif cmd == '2':
        word = random.choice(STATIC_WORDS)
        play_game(word.lower())

    else:
        print('Unknown command, please try again')
