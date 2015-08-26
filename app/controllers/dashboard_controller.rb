class DashboardController < ApplicationController
  add_breadcrumb I18n.t('global.title'), :root_path
  add_breadcrumb I18n.t('pages.dashboard.title'), :root_path

  def index
  end
end
