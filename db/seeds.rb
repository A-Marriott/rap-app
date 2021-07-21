Word.destroy_all

words = File.open("db/words.txt").read.split
words.each do |word|
  if word.length > 2
    Word.create(name: word)
  end
end
