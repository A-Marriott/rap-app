class PagesController < ApplicationController
  require 'json'
  require 'open-uri'
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @rand_word = Word.all.sample.name.capitalize
    rhyming_word_url = "https://rhymebrain.com/talk?function=getRhymes&word=#{@rand_word}"
    rhyming_words_array = JSON.parse(URI.open(rhyming_word_url).read)[0...100]
    @rhyming_words = rhyming_words_array.map { |rhyme_hash| rhyme_hash["word"].capitalize }

    search_string = case params["q"]
                    when 'boombap'
                      'boombap'
                    when 'trap'
                      'trap'
                    when 'drill'
                      'drill'
                    when 'lofi'
                      'lofi'
                    when 'grime'
                      'grime'
                    when 'jazz_rap'
                      'jazz_rap'
                    else
                      'freestyle'
                    end

    @random_video_id = YoutubeVideo.where(genre: search_string).order(Arel.sql('RANDOM()')).first.video_id
    # raise
  end
end
