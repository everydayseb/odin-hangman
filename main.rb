MIN_WORD_LENGTH = 5
MAX_WORD_LENGTH = 12
dictionary_file = 'data/google-10000-english-no-swears.txt'
dictionary = File.readlines(dictionary_file)
                 .map(&:chomp)
                 .select { |word| word.size.between?(MIN_WORD_LENGTH, MAX_WORD_LENGTH) }
word = dictionary.sample
p word
