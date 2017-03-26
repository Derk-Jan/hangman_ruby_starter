require File.expand_path("../random_word", __FILE__)
require_relative "random_word.rb"
#attr_accessor :random_word

class Hangman
  def initialize
    @random_word = RandomWord.new
    @bad_guesses_left = 10
    @play = true
  end



  def play!
    puts "Hi from lib/hangman.rb!"
    puts "Do you wanna play?"
    while @play == true
      puts "Type Yes or No"
      answer = gets.chomp.upcase
      if answer == "YES"
        puts "Let's play!"
        @random_word.word_length
        self.start_play
      elsif answer == "NO"
        puts "You don't know what you are missing!"
        @play = false
      else
      puts "I'm not sure? What do you want"
      end
    end
  end


  def start_play
    if @play == true
    #puts "Guess the word with #{@word_length} characters:"
    @random_word.game_on
    #puts "guess which word is: #{@guess_string}"
    #  puts "#{@randomword}"
    else
      exit
    end
end



end
