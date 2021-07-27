class PagesController < ApplicationController
  require 'json'
  require 'open-uri'
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @rand_word = Word.all.sample.name.capitalize
    rhyming_word_url = "https://rhymebrain.com/talk?function=getRhymes&word=#{@rand_word}"
    rhyming_words_array = JSON.parse(URI.open(rhyming_word_url).read)[0...100]
    @rhyming_words = rhyming_words_array.map {|rhyme_hash| rhyme_hash["word"].capitalize }

    search_string = case params["q"]
                    when 'boombap'
                      'boombap_instrumental'
                    when 'trap'
                      'trap_instrumental'
                    when 'drill'
                      'drill_instrumental'
                    when 'lofi'
                      'lofi_instrumental'
                    when 'grime'
                      'grime_instrumental'
                    when 'jazz_rap'
                      'jazz_rap_instrumental'
                    else
                      'freestyle_instrumental'
                    end

    youtube_video_search_url = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=#{search_string}&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"

    video_ids = JSON.parse(URI.open(youtube_video_search_url).read)["items"].map do |item|
      item["id"]["videoId"]
    end

    @random_video_id = video_ids.sample

    # raise
  end
end
