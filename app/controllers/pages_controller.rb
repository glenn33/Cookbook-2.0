require 'json'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :recipies, :show ]

  def home
  end

  def recipies
    url = "https://api.spoonacular.com/recipes/complexSearch?query=#{params[:search]}&number=12&apiKey=76b2170d78fc4e8b836a1055b10502a7"
    recipies = search(url)
    @recipies = recipies["results"]
    session[:recipies] = @recipies
  end

  def show
    @recipie = session[:recipies].find {|x| x["id"] == params[:id].to_i}
    session[:show_recipie] = @recipie
    url = "https://api.spoonacular.com/recipes/#{@recipie["id"]}/information?includeNutrition=true&apiKey=76b2170d78fc4e8b836a1055b10502a7"
    @recipie = search(url)
  end

  private

  def search(url)
    serialized_url = URI.open(url).read
    recipie = JSON.parse(serialized_url)
  end
end
