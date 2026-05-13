def word_with_known_letters(word, guessed_letters)
  new_string = ''
  word.each_char { |char| new_string << (guessed_letters.include?(char) ? char : '_') }
  new_string
end

MIN_WORD_LENGTH = 5
MAX_WORD_LENGTH = 12
dictionary_file = 'data/google-10000-english-no-swears.txt'
dictionary = File.readlines(dictionary_file)
                 .map(&:chomp)
                 .select { |word| word.size.between?(MIN_WORD_LENGTH, MAX_WORD_LENGTH) }
word = dictionary.sample
guessed_letters = ['a']
puts word_with_known_letters(word, guessed_letters)
