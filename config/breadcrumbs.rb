crumb :root do
  link I18n.t('global.title'), root_path
end

### Gliders

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

### Rights

crumb :rights do
  link I18n.t('pages.rights.titles.index'), rights_path
end

crumb :pilot_rights do |pilot|
  # TODO: Fix the pilot url when available.
  link pilot.name, root_path
  link I18n.t('global.links.edit'), edit_pilot_rights_path(pilot)

  parent :rights
end

### Profiles

crumb :profile do |editable|
  if editable
    link I18n.t('pages.profiles.titles.edit'), edit_profile_path
  else
    link I18n.t('pages.profiles.titles.show'), profile_path
  end
end

### Accounts

crumb :account do
  link I18n.t('pages.accounts.title'), edit_account_path
end
