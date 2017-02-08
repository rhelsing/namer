require 'open-uri'
require 'pry'
require 'json'
require 'nokogiri'

# seed = %w(aid help serve broker
# ensure secure cover protect
# enable connect extend integrate
# collect aggregate bank ally
# friend advisor)

# seed = %w(bunker umbrella raincoat aegis net shield armor cushion fortify protection lock case shelter roof covering shell)

seed = %w(offer serve ensure comfort comfortable accord peace harmony)

#combo expansion
#prepend, post expansion

data = {}
#thesaurus expansion
seed.each do |word|
  puts word
  url = "http://words.bighugelabs.com/api/2/40c48572ef751276c0bc1282a45bd26f/#{word}/json"
  data[word] = JSON.load(open(url))
end

words = Hash.new([])
data.each do |k, v|
  v.each do |x, y|
    words[k] += y["syn"] if y["syn"] != nil
  end
  words[k] = words[k].uniq
end

# https://translate.google.com/?q=happy&sl=en&tl=la
# https://translate.google.com/?q=happy&sl=en&tl=fr
# https://translate.google.com/?q=happy&sl=en&tl=es
# https://translate.google.com/?q=happy&sl=en&tl=sw
# https://translate.google.com/?q=happy&sl=en&tl=sm
# https://translate.google.com/?q=happy&sl=en&tl=uz

#itailian too

wordss = []
words.each do |k, v|
  wordss << k
  wordss += v
  # puts v.join(". ")
  # puts
end

wordss.sort{|x, y| x.length <=> y.length}.uniq.each{|x| p x}



# download = open("https://translate.googleapis.com/translate_a/single?client=gtx&dt=t&q=#{words[0]}&sl=en&tl=la")
# IO.copy_stream(download, '~/a.txt')

#filter/split based on sylable count
#ML, assign score
#rank
#show top 10
