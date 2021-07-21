class PagesController < ApplicationController
  require 'json'
  require 'open-uri'
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @rand_word = Word.all.sample.name
    url = "https://rhymebrain.com/talk?function=getRhymes&word=#{@rand_word}"
    rhyming_words_array = JSON.parse(URI.open(url).read).shuffle[0...100]
    @rhyming_words = rhyming_words_array.map {|rhyme_hash| rhyme_hash["word"] }
  end
end
