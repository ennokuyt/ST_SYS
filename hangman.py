import random
import re
from string import ascii_letters

INPUT_PREFIX = ' > '

STATIC_LIVES = 6
STATIC_WORDS = ['software', 'testing', 'whitebox', 'blackbox', 'coverage', 'mutation', 'unittesting', 'inspection',
                'evaluation', 'pseudocode', 'statement', 'decision', 'condition', 'complexity', 'predicate']
HANGMAN_PICS = ['     +---+\n         |\n         |\n         |\n        ===',
                '     +---+\n     O   |\n         |\n         |\n        ===',
                '     +---+\n     O   |\n     |   |\n         |\n        ===',
                '     +---+\n     O   |\n    /|   |\n         |\n        ===',
                '     +---+\n     O   |\n    /|\  |\n         |\n        ===',
                '     +---+\n     O   |\n    /|\  |\n    /    |\n        ===',
                '     +---+\n     O   |\n    /|\  |\n    / \  |\n        ===']


def play_game(word):
    # word list easier to index/manipulate
    word_list = list(word)
    n = len(word_list)
    letters = set(word_list)

    guessed = set()
    guessed_string = ['_' for i in range(n)]

    lives = STATIC_LIVES

    while lives > 0:
        print(f'---\nGuessing word with {n} characters: {"".join(guessed_string)}')
        print(f'Guessed letters: {" ".join(sorted(guessed))}')
        print(f'Lives left: {lives}')
        print(HANGMAN_PICS[STATIC_LIVES-lives])

        cmd = input(INPUT_PREFIX)
        if re.match('^[a-zA-Z]$', cmd):
            letter_guess = cmd.lower()

            if letter_guess in guessed:
                print('You already guessed this letter, please select another letter or guess the word')
                continue

            guessed.add(letter_guess)
            if letter_guess in letters:
                print('You got a hit!')
                for i in [i for i, ltr in enumerate(word_list) if ltr == letter_guess]:
                    guessed_string[i] = letter_guess
                if '_' not in guessed_string:  # Somehow it seems better to check if the guessed and letters set are eq
                    print(f'You win the game! The word was "{word}"')
                    return
            else:
                print('That letter was not in the word, you lost a life')
                lives -= 1

        elif re.match(f'^[a-zA-Z]{{n}}$', cmd):
            word_guess = cmd.lower()
            if word_guess == word:
                print('You guessed the word, congratulations!')
                return
            else:
                print('That is not the correct word, continue guessing letters or try another word')
                lives -= 1
        else:
            print('Wrong input, please try again')
            # TODO optional: Explain what was wrong about the input

            # if ...
            # print(f'Please put in only one letter or {n} letters for a guess')
            # continue

            # if not letter.isalpha():
            # print('Please put in a letter a-z or A-Z')
            # continue

    print(HANGMAN_PICS[STATIC_LIVES])
    print(f'Game over! The word was "{word}"')


print('Welcome to Hangman - A Testers Nightmare Expansion\n'
      'In this game, you will be guessing a word related to the software testing course')

play_game(random.choice(STATIC_WORDS))

