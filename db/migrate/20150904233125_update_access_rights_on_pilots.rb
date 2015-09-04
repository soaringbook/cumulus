class UpdateAccessRightsOnPilots < ActiveRecord::Migration
  def up
    say_with_time 'Updating admin and glider access rights on pilots...' do
      Pilot.find_each do |pilot|
        say "Updating pilot: #{pilot.email}"
        pilot.update!(admin: false, glider_access: 0)
      end
    end
  end
end
