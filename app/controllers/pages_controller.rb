require 'json'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :recipies, :show ]

  def home
  end

  def recipies
    recipies = search(params[:search])
    @recipies = recipies["results"]
  end

  def show
  end

  private

  def search(word)
    url = "https://api.spoonacular.com/recipes/complexSearch?query=#{word}&apiKey=76b2170d78fc4e8b836a1055b10502a7"
    serialized_url = URI.open(url).read
    recipie = JSON.parse(serialized_url)
  end
end
