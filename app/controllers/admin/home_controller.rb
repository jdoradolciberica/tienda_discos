class Admin::HomeController < ApplicationController
  before_action :requiere_ser_admin
  def index
  end
end
