import random
import re

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


class Hangman:
    def __init__(self, lives=STATIC_LIVES, pics=HANGMAN_PICS, words=STATIC_WORDS):
        self.lives = lives
        self.pics = HANGMAN_PICS
        self.words = STATIC_WORDS

        self.word = random.choice(self.words)
        self.word_list = list(self.word)
        self.letters = set(self.word_list)
        self.n = len(self.word_list)
        self.guessed_letters = set()
        self.guessed_string = ['_' for _ in range(self.n)]

        self.word_guessed = False
        self.last_error = 0

        self.play()

    def show_info(self):
        print(f'Guessing word with {self.n} characters: {"".join(self.guessed_string)}')
        print(f'Guessed letters: {" ".join(sorted(self.guessed_letters))}')
        print(f'Lives left: {self.lives}')
        print(HANGMAN_PICS[-(self.lives+1)])

    def step(self, cmd):
        if re.match('^[a-zA-Z]$', cmd):
            letter_guess = cmd.lower()

            if letter_guess in self.guessed_letters:
                print('You already guessed this letter, please select another letter or guess the word')
                return

            self.guessed_letters.add(letter_guess)
            if letter_guess in self.letters:
                print('You got a hit!')
                for i in [i for i, ltr in enumerate(self.word_list) if ltr == letter_guess]:
                    self.guessed_string[i] = letter_guess
                if '_' not in self.guessed_string:
                    self.word_guessed = True
                    return
            else:
                print('That letter was not in the word, you lost a life')
                self.lives -= 1

        elif re.match(f'^[a-zA-Z]{{{self.n}}}$', cmd):
            word_guess = cmd.lower()
            if word_guess == self.word:
                self.word_guessed = True
                return
            else:
                print('That is not the correct word, continue guessing letters or try another word')
                self.lives -= 1
        else:
            if not re.match(f'^[a-zA-Z]+$', cmd):
                self.last_error = 'bad character'
                print('Wrong input character, please provide only characters a-z or A-Z')
            elif not len(cmd) == self.n:
                self.last_error = 'bad length'
                print(f'Wrong input length, please provide only a single letter guess, '
                      f'or a word guess of {self.n} letters')
            else:
                self.last_error = 'unknown'
                print('Wrong input, please try again')

    def play(self):
        print('Welcome to Hangman - A Testers Nightmare Expansion\n'
              'In this game, you will be guessing a word related to the software testing course')
        while self.lives > 0 and not self.word_guessed:
            self.show_info()
            cmd = input(INPUT_PREFIX)
            self.step(cmd)

        if self.word_guessed:
            print('Congratulations, you guessed the word!')
        else:
            print('Too bad, you ran out of lives before guessing the correct word.\n'
                  f'The word was "{self.word}"')
        print('Thanks for playing!')


if __name__ == '__main__':
    h = Hangman()
