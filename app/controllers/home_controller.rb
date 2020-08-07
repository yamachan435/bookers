class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:top, :about]
  
  def top
    render layout: 'centering'
  end

  def about
  end
end
