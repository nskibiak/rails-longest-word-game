class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    require 'json'
    require 'open-uri'

    @guess = params[:guess].downcase
    @option_letters = params[:token].downcase.gsub(/[^a-z]/, '').split('')
    # @clean_array = @option_letters

    if !@guess.chars.all? { |letter| @guess.chars.count(letter) == @option_letters.count(letter) }
      @result = "Sorry, but #{@guess.upcase!} can't be built out of #{@option_letters.join(', ').upcase}"
    elsif JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@guess}").read)["found"] != true
      @result = "Sorry, but #{@guess.upcase!} does not seem to be a valid English word."
    else
      @result = "Congratulations! #{@guess.upcase!} is a valid English word!"
    end
  end
end
