class HomeController < ApplicationController
  def index
    @discos = Disco.all.limit 4
  end

  def contactanos
  end

  def sobre

  end

  def faq
    
  end
end
