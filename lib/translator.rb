require "yaml"
# require 'pry'
# #
# emoticons = {angel: ["O:)", "☜(⌒▽⌒)☞" ], angry: [">:(", "ヽ(ｏ`皿′ｏ)ﾉ"]}

def load_library(path)
  new_hash = {}
  new_new_hash = {}

  emoticons = YAML.load_file(path)
  emoticons.each do |key, value|

    new_hash[value[1]] = key.to_s
    new_new_hash[value[0]] = value[1]
end
  emoticon_hash = {"get_meaning" => new_hash, "get_emoticon" => new_new_hash}
end

# load_library(emoticons)



def get_japanese_emoticon(path, emoticon)
  new_hash = load_library(path)
  new_hash["get_emoticon"].each do |key, value|
    return value if key == emoticon
  end
  return "Sorry, that emoticon was not found" if !new_hash["get_emoticon"].include?(emoticon)
end

def get_english_meaning(path, emoticon)
  new_hash = load_library(path)
  new_hash["get_meaning"].each do |key, value|
    return value if key == emoticon
  end
  return "Sorry, that emoticon was not found" if !new_hash["get_meaning"].include?(emoticon)
end
