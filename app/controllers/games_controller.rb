class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @guess = params[:guess].downcase
    @option_letters = params[:token].downcase.gsub(/[^a-z]/, '').split('')
    @valid_word = check_word(@guess, @option_letters)
    @english_word = check_dictionary(@guess)
  end

  def check_word(guess, letters)
    true if guess.chars.all? do |letter|
      guess.chars.count(letter) == letters.count(letter)
    end
  end

  def check_dictionary(guess)
    require 'json'
    require 'open-uri'
    request_url = "https://wagon-dictionary.herokuapp.com/#{guess}"
    response = open(request_url).read
    result = JSON.parse(response)
    result['found']
  end
end
