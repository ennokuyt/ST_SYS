# System imports
import unittest
from unittest.mock import patch, MagicMock

from hangman import Hangman

NUM_LIVES = 2


class TestHangman(unittest.TestCase):
    def setUp(self):
        self.h = Hangman(lives=NUM_LIVES, words=['word'], play=False)

    # @unittest.mock.patch('builtins.input', side_effect=['w'])
    def test_correct_letter(self):
        self.h.show_hit_letter = MagicMock()
        self.h.step('w')
        self.h.show_hit_letter.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, NUM_LIVES)

    def test_wrong_letter(self):
        self.h.show_miss_letter = MagicMock()
        self.h.step('a')
        self.h.show_miss_letter.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, NUM_LIVES - 1)

    def test_already_guessed_letter(self):
        self.h.show_miss_letter = MagicMock()
        self.h.show_already_guessed = MagicMock()
        self.h.step('a')
        self.h.step('a')
        self.h.show_miss_letter.assert_called_once()
        self.h.show_already_guessed.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, NUM_LIVES - 1)

    def test_correct_word(self):
        self.h.show_win = MagicMock()
        self.h.step('word')
        self.h.show_win.assert_called_once()
        self.assertTrue(self.h.word_guessed)
        self.assertEqual(self.h.lives, NUM_LIVES)

    @unittest.mock.patch('builtins.input', side_effect=['w', 'o', 'r', 'd'])
    def test_correct_word_with_letters(self, mock_input):
        self.h.show_hit_letter = MagicMock()
        self.h.show_win = MagicMock()
        self.h.show_goodbye = MagicMock()
        self.h.play()
        self.assertEqual(self.h.show_hit_letter.call_count, 4)
        self.h.show_win.assert_called_once()
        self.h.show_goodbye.assert_called_once()
        self.assertTrue(self.h.word_guessed)
        self.assertEqual(self.h.lives, NUM_LIVES)

    def test_wrong_word(self):
        self.h.show_wrong_word = MagicMock()
        self.h.step('wrod')
        self.h.show_wrong_word.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, NUM_LIVES - 1)

    def test_wrong_input_character(self):
        self.h.show_bad_char = MagicMock()
        self.h.step('å')
        self.h.show_bad_char.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, NUM_LIVES)

    def test_wrong_input_length(self):
        self.h.show_bad_length = MagicMock()
        self.h.step('wor')
        self.h.show_bad_length.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, NUM_LIVES)

    @unittest.mock.patch('builtins.input', side_effect=['a', 'b'])
    def test_game_over(self, mock_input):
        self.h.show_miss_letter = MagicMock()
        self.h.show_game_over = MagicMock()
        self.h.show_goodbye = MagicMock()
        self.h.play()
        self.assertEqual(self.h.show_miss_letter.call_count, 2)
        self.h.show_game_over.assert_called_once()
        self.h.show_goodbye.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, 0)


if __name__ == '__main__':
    # Run test
    unittest.main()

    # Coverage testing

    # Mutation testing
