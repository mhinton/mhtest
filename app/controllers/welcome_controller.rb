class WelcomeController < ApplicationController

  def index
    @message = "Welcome the time is #{DateTime.now.to_s}"
  end
end
