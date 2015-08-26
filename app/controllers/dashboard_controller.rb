class DashboardController < ApplicationController
  add_breadcrumb 'Soaring Book', :root_path
  add_breadcrumb 'Dashboard', :root_path

  def index
  end
end
