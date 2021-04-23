# System imports
import io
from contextlib import redirect_stdout
import unittest
from unittest.mock import patch, MagicMock

from hangman_game.hangman import Hangman, STATIC_LIVES, HANGMAN_PICS


class TestHangman(unittest.TestCase):
    def setUp(self):
        self.h = Hangman(lives=STATIC_LIVES, words=['word'])

    def test_correct_letter(self):
        self.h.show_hit_letter = MagicMock(side_effect=self.h.show_hit_letter)
        self.h.step('w')
        self.h.show_hit_letter.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, STATIC_LIVES)

    def test_wrong_letter(self):
        self.h.show_miss_letter = MagicMock(side_effect=self.h.show_miss_letter)
        self.h.step('a')
        self.h.show_miss_letter.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, STATIC_LIVES - 1)

    def test_already_guessed_letter(self):
        self.h.show_miss_letter = MagicMock(side_effect=self.h.show_miss_letter)
        self.h.show_already_guessed = MagicMock(side_effect=self.h.show_already_guessed)
        self.h.step('a')
        self.h.step('a')
        self.h.show_miss_letter.assert_called_once()
        self.h.show_already_guessed.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, STATIC_LIVES - 1)

    def test_correct_word(self):
        self.h.show_win = MagicMock(side_effect=self.h.show_win)
        self.h.step('word')
        self.h.show_win.assert_called_once()
        self.assertTrue(self.h.word_guessed)
        self.assertEqual(self.h.lives, STATIC_LIVES)

    @unittest.mock.patch('builtins.input', side_effect=['w', 'o', 'r', 'd'])
    def test_correct_word_with_letters(self, mock_input):
        self.h.show_hit_letter = MagicMock(side_effect=self.h.show_hit_letter)
        self.h.show_win = MagicMock(side_effect=self.h.show_win)
        self.h.show_goodbye = MagicMock(side_effect=self.h.show_goodbye)
        self.h.play()
        self.assertEqual(self.h.show_hit_letter.call_count, 4)
        self.h.show_win.assert_called_once()
        self.h.show_goodbye.assert_called_once()
        self.assertTrue(self.h.word_guessed)
        self.assertEqual(self.h.lives, STATIC_LIVES)

    def test_wrong_word(self):
        self.h.show_wrong_word = MagicMock(side_effect=self.h.show_wrong_word)
        self.h.step('wrod')
        self.h.show_wrong_word.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, STATIC_LIVES - 1)

    def test_wrong_input_character(self):
        self.h.show_bad_char = MagicMock(side_effect=self.h.show_bad_char)
        self.h.step('å')
        self.h.show_bad_char.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, STATIC_LIVES)

    def test_wrong_input_empty(self):
        self.h.show_bad_empty = MagicMock(side_effect=self.h.show_bad_empty)
        self.h.step('')
        self.h.show_bad_empty.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, STATIC_LIVES)

    def test_wrong_input_length(self):
        self.h.show_bad_length = MagicMock(side_effect=self.h.show_bad_length)
        self.h.step('wor')
        self.h.show_bad_length.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, STATIC_LIVES)

    @unittest.mock.patch('builtins.input', side_effect=['a', 'b', 'c', 'e', 'f', 'g'])
    def test_game_over(self, mock_input):
        self.h.show_miss_letter = MagicMock(side_effect=self.h.show_miss_letter)
        self.h.show_game_over = MagicMock(side_effect=self.h.show_game_over)
        self.h.show_goodbye = MagicMock(side_effect=self.h.show_goodbye)
        self.h.play()
        self.assertEqual(self.h.show_miss_letter.call_count, STATIC_LIVES)
        self.h.show_game_over.assert_called_once()
        self.h.show_goodbye.assert_called_once()
        self.assertFalse(self.h.word_guessed)
        self.assertEqual(self.h.lives, 0)

    def test_lives_pics(self):
        self.assertEqual(self.h.lives, len(self.h.pics)-1)

    def test_correct_pics(self):
        for i in range(STATIC_LIVES):
            with io.StringIO() as f:
                with redirect_stdout(f):
                    self.h.show_info()
                self.assertTrue(HANGMAN_PICS[i] in f.getvalue())
            self.h.lives -= 1


if __name__ == '__main__':
    # Run test
    unittest.main()
