crumb :root do
  link I18n.t('global.title'), root_path
end

crumb :dashboard do
  link I18n.t('pages.dashboard.title'), root_path
end

crumb :gliders do
  link I18n.t('pages.gliders.titles.index'), gliders_path
end

crumb :glider do |glider, editable|
  if editable
    if glider.new_record?
      # The add page.
      link I18n.t('global.links.new'), new_glider_path
    else
      # The edit page.
      link glider.immatriculation, glider_path(glider)
      link I18n.t('global.links.edit'), edit_glider_path(glider)
    end
  else
    # The show page.
    link glider.immatriculation, glider_path(glider)
  end
  parent :gliders
end

crumb :import_gliders do
  link I18n.t('global.links.import'), import_gliders_path
  parent :gliders
end
