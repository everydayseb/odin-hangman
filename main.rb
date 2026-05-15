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
guessed_letters = []
lives_remaining = 5
game_over = false

until game_over
  puts word_with_known_letters(word, guessed_letters)
  puts "Lives remaining: #{lives_remaining}"
  print 'Enter guess: '
  guess = gets.chomp
  guessed_letters.push(guess) if guessed_letters.none?(guess)
  puts "Guessed letters: #{guessed_letters.sort.join(' ')}"

  lives_remaining -= 1 if word.chars.none?(guess)

  game_over = true if word_with_known_letters(word, guessed_letters) == word || lives_remaining <= 0
end

puts "Word was #{word}"
