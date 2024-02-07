class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso Ruby on Rails" 
    session[:curso] = "Curso Ruby on Rails" 
    @meu_nome = params[:nome]
    @curso = "Rails"
  end
end
