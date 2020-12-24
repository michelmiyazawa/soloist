class HomesController < ApplicationController
  def top
    @reviews = Review.all.order("created_at DESC").limit(5)
  end

  def about
  end
end
