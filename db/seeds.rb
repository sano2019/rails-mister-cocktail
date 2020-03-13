# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_serialized = open(url).read
parsed_ingredients = JSON.parse(ingredient_serialized)
array_of_ingredients = parsed_ingredients['drinks']

array_of_ingredients.each do |ingredient_hash|
ingredient = Ingredient.new(
  name: ingredient_hash['strIngredient1']
  )
ingredient.save!
end

# 1. Require 'open-uri'
# 2. Store the url in a variable
# 3. Use open(url).read to make an http request to the url
# 4. It will return some json text => Use JSON.parse to parse it to something ruby understands (hash, or array of hashes)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# i = 0
# 10.times do
#   stories = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{id[i]}.json"
#   parsed_story = JSON.parse(stories)
#   post = Post.new(
#     title: parsed_story['title'],
#     url: parsed_story['url']
#   )
#   i += 1
#   post.save!
# end
