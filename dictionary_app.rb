require "http"

while true
  print "Please enter a word: "
  user_input = gets.chomp
  if user_input == "q"
    break
  else
    word = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=APIKEY")

    p word.parse[0]["text"]

    pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/pizza/pronunciations?useCanonical=false&limit=50&api_key=APIKEY")

    p pronunciation.parse[0]["raw"]
  end
end  