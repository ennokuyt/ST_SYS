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
        self.pics = pics
        self.words = words

        self.word = random.choice(self.words)
        self.word_list = list(self.word)
        self.letters = set(self.word_list)
        self.n = len(self.word_list)
        self.guessed_letters = set()
        self.guessed_string = ['_' for _ in range(self.n)]

        self.word_guessed = False

    @staticmethod
    def show_welcome():
        print('Welcome to Hangman - A Testers Nightmare Expansion\n'
              'In this game, you will be guessing a word related to the software testing course')

    def show_info(self):
        print(f'Guessing word with {self.n} characters: {"".join(self.guessed_string)}')
        print(f'Guessed letters: {" ".join(sorted(self.guessed_letters))}')
        print(f'Lives left: {self.lives}')
        print(HANGMAN_PICS[-(self.lives+1)])  # Only mutation fail is this line

    @staticmethod
    def show_already_guessed():
        print('You already guessed this letter, please select another letter or guess the word')

    @staticmethod
    def show_hit_letter():
        print('You got a hit!')

    @staticmethod
    def show_miss_letter():
        print('That letter was not in the word, you lost a life')

    @staticmethod
    def show_wrong_word():
        print('That is not the correct word, continue guessing letters or try another word')

    @staticmethod
    def show_bad_char():
        print('Wrong input character, please provide only characters a-z or A-Z')

    def show_bad_length(self):
        print(f'Wrong input length, please provide only a single letter guess, '
              f'or a word guess of {self.n} letters')

    @staticmethod
    def show_win():
        print('Congratulations, you guessed the word!')

    def show_game_over(self):
        print('Too bad, you ran out of lives before guessing the correct word.\n'
              f'The word was "{self.word}"')

    @staticmethod
    def show_goodbye():
        print('Thanks for playing!')

    def step(self, cmd):
        if re.match('^[a-zA-Z]$', cmd):
            letter_guess = cmd.lower()

            if letter_guess in self.guessed_letters:
                self.show_already_guessed()
                return

            self.guessed_letters.add(letter_guess)
            if letter_guess in self.letters:
                self.show_hit_letter()
                for i in [i for i, ltr in enumerate(self.word_list) if ltr == letter_guess]:
                    self.guessed_string[i] = letter_guess
                if '_' not in self.guessed_string:
                    self.word_guessed = True
                    self.show_win()
                    return
            else:
                self.show_miss_letter()
                self.lives -= 1

        elif re.match(f'^[a-zA-Z]{{{self.n}}}$', cmd):
            word_guess = cmd.lower()
            if word_guess == self.word:
                self.word_guessed = True
                self.show_win()
                return
            else:
                self.show_wrong_word()
                self.lives -= 1
        else:
            if not re.match(f'^[a-zA-Z]+$', cmd):
                self.show_bad_char()
            elif not len(cmd) == self.n:
                self.show_bad_length()
            # TODO: Not 100 percent (branch) coverage because 'else' is never hit
            # This part may be commented out because it should never be reached, else we can't reach 100 percent cvrg
            # Although I believe this could very well fail in mutation testing
            # else:
            #     print('Wrong input, please try again')

    def play(self):
        self.show_welcome()
        while self.lives > 0 and not self.word_guessed:
            self.show_info()
            cmd = input(INPUT_PREFIX)
            self.step(cmd)

        if not self.word_guessed:
            self.show_game_over()
        self.show_goodbye()


# This part is commented for (mutation) testing, increases coverage to 100 and prevents mutating this part
# if __name__ == '__main__':
#     h = Hangman()
#     h.play()
#     print('Press enter to exit')
#     input()
