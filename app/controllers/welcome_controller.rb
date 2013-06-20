class WelcomeController < ApplicationController

  def index
    @message = "Welcome the time is #{DateTime.now.to_formatted_s(:rfc822)}"
  end
end
