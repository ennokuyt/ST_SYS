# System imports
import io
import sys
import unittest

from hangman import Hangman


# Unit Test cases
# 1. Empty class, guess a letter, incorporated in guessed and in guessed_string when hit
# 2. Empty class, guess a letter, incorporated in guessed and not in guessed_string when not hit
# 3. Word guess wrong
# 4. Word guess right
# 5. Weird character -> this is probably difficult
# 6. Wrong length guess
# 7. Run out of lives check
class TestHangman(unittest.TestCase):
    def __init__(self):
        self.start_lives = 2
        super().__init__()

    def setUp(self):
        self.h = Hangman(lives=self.start_lives, words=['word'])
        self.console = io.StringIO()
        sys.stdout = self.console

    def test_correct_letter(self):
        self.h.step('w')
        assert 'hit' in self.console
        assert self.h.lives == self.start_lives

    def test_wrong_letter(self):
        self.h.step('a')
        assert 'not in the word' in self.console
        assert self.h.lives == self.start_lives - 1

    def test_correct_word(self):
        self.h.step('word')
        assert self.h.word_guessed
        assert 'Congratulations' in self.console

    def test_wrong_word(self):
        self.h.step('wrod')
        assert not self.h.word_guessed
        assert self.h.lives == self.start_lives - 1
        assert 'not the correct word' in self.console

    def test_wrong_input_character(self):
        self.h.step('å')
        assert self.h.lives == self.start_lives
        assert 'character' in self.console

    def test_wrong_input_length(self):
        self.h.step('wor')
        assert 'length' in self.console
        assert self.h.lives == self.start_lives

    def test_game_over(self):
        self.h.step('a')
        self.h.step('b')
        assert self.h.lives == 0
        assert 'Too bad' in self.console


# Coverage testing

# Mutation testing
