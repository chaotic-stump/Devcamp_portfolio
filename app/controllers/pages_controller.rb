class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @portfolio_items = Portfolio.all
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
end
