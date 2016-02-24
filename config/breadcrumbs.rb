crumb :root do
  link I18n.t('global.title'), root_path
end

### Clubs

crumb :clubs do
  link I18n.t('pages.clubs.titles.index'), clubs_path
end

crumb :club do |club, editable|
  if editable
    if club.new_record?
      # The add page.
      link I18n.t('global.links.new'), new_club_path
    else
      # The edit page.
      link club.short_name.upcase, club_path(club)
      link I18n.t('global.links.edit'), edit_club_path(club)
    end
  else
    # The show page.
    link club.short_name.upcase, club_path(club)
  end
  parent :clubs
end

### Pilots

crumb :pilots do
  link I18n.t('pages.pilots.titles.index'), pilots_path
end

crumb :pilot do |pilot, editable|
  if editable
    if pilot.new_record?
      # The add page.
      link I18n.t('global.links.new'), new_pilot_path
    else
      # The edit page.
      link pilot.name, pilot_path(pilot)
      link I18n.t('global.links.edit'), edit_pilot_path(pilot)
    end
  else
    # The show page.
    link pilot.name, pilot_path(pilot)
  end
  parent :pilots
end

crumb :import_pilots do
  link I18n.t('global.links.import'), import_pilots_path
  parent :pilots
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
      link glider.immatriculation.upcase, glider_path(glider)
      link I18n.t('global.links.edit'), edit_glider_path(glider)
    end
  else
    # The show page.
    link glider.immatriculation.upcase, glider_path(glider)
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
