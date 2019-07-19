# coding: utf-8
require 'lingua/stemmer'
require 'pragmatic_tokenizer'
require 'morphy2'
require 'pry'
str = "Жили были дед, да бабка, да Зельда, красавицей была, но не очень умной."

puts str

tkn = PragmaticTokenizer::Tokenizer.new(languague: :ru)
tokenized = tkn.tokenize str
p tokenized

morphy = Morphy.new

p tokenized.map { |x| p x; morphy.query(x).first&.normal_form  } 

# stemmer= Lingua::Stemmer.new(:language => "ru")
# p tokenized.map {|x| stemmer.stem(x) }

