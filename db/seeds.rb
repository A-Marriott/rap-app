def init_words
  Word.destroy_all

  words = File.open("db/words.txt").read.split
  words.each do |word|
    if word.length > 2
      Word.create(name: word)
    end
  end
end

def init_youtube_ids

end

# Comment functions out as needed

init_words
