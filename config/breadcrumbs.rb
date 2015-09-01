crumb :root do
  link I18n.t('global.title'), root_path
end

crumb :dashboard do
  link I18n.t('pages.dashboard.title'), root_path
end

crumb :gliders do
  link I18n.t('pages.gliders.titles.index'), gliders_path
end

crumb :glider_form do |glider|
  if glider.new_record?
    link I18n.t('pages.gliders.breadcrumbs.new'), new_glider_path
  else
    link glider.immatriculation, glider_path(glider)
  end
  parent :gliders
end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
