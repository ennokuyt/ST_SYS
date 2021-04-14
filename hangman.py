import random

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
    guessed_list = ['_' for i in range(n)]

    lives = STATIC_LIVES

    while lives > 0:
        print(f'---\nGuessing word with {n} characters: {"".join(guessed_list)}')
        print(f'Guessed letters: {" ".join(sorted(guessed))}')
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
      'In this game, you will be guessing a word related to the software testing course')

play_game(random.choice(STATIC_WORDS))

