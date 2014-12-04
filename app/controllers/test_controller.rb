class TestController < ApplicationController
	layout false

  def index
	#to jest odlowanie do pliku index.html.er
	@testowa = "Witam w kursie"
  
    @imiona = ['ola', 'kasia']
    
    @param1 = params[:param1].to_i
  end
  
  def face
    redirect_to('https://www.facebook.com/')
  end
  
   def gad
  
    
    @param1 = params[:param1].to_i
  end
  
end
