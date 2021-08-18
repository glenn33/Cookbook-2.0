class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :recipies ]

  def home
  end

  def recipies
  end
end
