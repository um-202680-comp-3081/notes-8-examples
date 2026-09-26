# lib/thermostat.rb
class Thermostat
  MIN = 50
  MAX = 90

  attr_reader :target

  def initialize(target = 68)
    set(target)
  end

  def set(degrees)
    unless degrees.between?(MIN, MAX)
      raise ArgumentError, "Target must be from #{MIN} to #{MAX}"
    end
    @target = degrees
  end

  def warmer(degrees)
    set(target + degrees)
  end

  def mode(room)
    if room < target
      "heat"
    elsif room > target
      "cool"
    else
      "off"
    end
  end

  def report
    puts "Target: #{target} degrees"
  end
end
