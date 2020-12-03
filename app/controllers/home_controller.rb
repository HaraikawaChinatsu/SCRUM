class HomeController < ApplicationController

  def top
    @count = Order.ordered_today.count
  end

  def about
  end


end
