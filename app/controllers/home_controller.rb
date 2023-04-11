class HomeController < ApplicationController
  def index
    @discos = Disco.all.limit 4
  end
end
