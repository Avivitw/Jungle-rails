class Admin::DashboardController < ApplicationController
      # HTTP BASIC AUTHENTICATION for admin pages
  include HttpAuthConcern
  
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
  end
end
