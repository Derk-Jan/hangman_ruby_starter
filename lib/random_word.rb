class RandomWord
  attr_reader :word
  attr_accessor :word
  attr_accessor :characters
  attr_accessor :word_length
  attr_accessor :guess_string


  WORDS = %w(programming monkeybusiness rubyesque styleguide)

  def initialize
    @word = WORDS.sample
    @word_letters = @word.split(//)
    @guesses = []
    @counter = 9
  end

  def word_length
    @word_length = @word.size
    puts "test word_length #{@word_length}"
  end


  def game_on
    @guess_string = ("-" * @word_length)
    puts " guess which word: #{@guess_string}"
    puts "Guess the word with #{@word_length} characters:"
    # puts "Test word = #{@word}"
    while @counter > 0 || @win == false
      print "Type please one character or ...if you got a hint: the whole word:"
      self.guess_string
      if @word_match == true
        puts "You are trying the whole word? Let see!"
        self.word_match
      else
        self.character_search
      end
      @counter  -= 1
      if @win == true
        break
      elsif @check == true
        self.positions_for
      elsif @counter ==  0
        puts "Aah big, big,  big dissapointment: You've lost!"
      else
        puts "Next time better, lets try again"
      end
    end
  end

  def guess_string
    @word_match = false
    @characters = gets.chomp
    if @characters.size > 1
      @word_match = true
    end
    @guesses << @characters
  end

  def word_match
   if @word == @characters
     puts "you guessed the name right!"
     puts "Do you wanna play again?"
     @win = true
   else
     puts "you guessed the name wrong. try again"
   end
 end



  def character_search
      string = @word
      #check_string = (0 ... string.length).find_all { |i| string[i,1] == @character}
      if @word_letters.include? @characters
        @check = true
        puts "Very good you guessed right"
      else
        @check = false
        puts "Sorry, try it once more"
      end
  end




  def positions_for
    @win = true
    display_string = ''
    @word.chars.each do |char|
      if @guesses.include?(char)
        display_string << char
      else
        display_string << '-'
        @win= false
      end
    end
    if @win == true
      puts "Yes it is: #{display_string}"
      puts "you are a winner"
      puts "Do you wanna play again?"
    else
      display_string
      puts "test  positions for method #{display_string}"
      puts " you've got #{@counter} times left to choose."
    end
  end
end
