require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

pig = Cult.new("PIG", "D.C.", 1882, "More For Me", 10)
pog = Cult.new("POG", "D.C.", 1975, "Less For You", 15)
mariners = Cult.new("Seattle Mariners", "Seattle", 1977, "Hurts so good.", 2)
borg = Cult.new("Borg", "Unimatrix 001", 2259, "Resistance is futile", 11)

drone1 = Follower.new("drone 1", 23, "meh")
drone2 = Follower.new("drone 2", 25, "hmm")
drone3 = Follower.new("drone 3", 53, "huh")

fan1 = Follower.new("fan1", 34, "oww")
fan2 = Follower.new("fan2", 35, "why")
fan3 = Follower.new("fan3", 36, "noooo")
fan4 = Follower.new("fan4", 34, "oww")
fan5 = Follower.new("fan5", 35, "why")
fan6 = Follower.new("fan6", 36, "noooo")
fan7 = Follower.new("fan7", 34, "oww")
fan8 = Follower.new("fan8", 35, "why")

young_fan = Follower.new("fan9", 9, "noooo")

borg.recruit_follower(drone1)
borg.recruit_follower(drone2)
borg.recruit_follower(drone3)

fan1.join_cult(mariners)
fan2.join_cult(mariners)
fan3.join_cult(mariners)
fan4.join_cult(mariners)
fan5.join_cult(mariners)
fan6.join_cult(mariners)

pig.recruit_follower(drone1)
drone1.join_cult(mariners)
drone2.join_cult(mariners)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits