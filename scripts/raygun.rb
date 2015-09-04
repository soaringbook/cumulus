#! /usr/bin/ruby

require 'raygun4ruby'

begin
  raise 'FUBAR'
rescue Exception => e
  Raygun.track_exception(e)
end
