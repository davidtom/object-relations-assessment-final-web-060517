require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#Create viewers
Viewer.new("David", "Tomczyk")
Viewer.new("Evan", "Tomczyk")
Viewer.new("Jenni", "Tomczyk")
Viewer.new("John", "Doe")
Viewer.new("Jane", "Plain")


#Create movies
Movie.new("The Departed")
Movie.new("In Bruges")

#Associate viewers with variables
dt = Viewer.find_by_name("David Tomczyk")
et = Viewer.find_by_name("Evan Tomczyk")
jt = Viewer.find_by_name("Jenni Tomczyk")
jd = Viewer.find_by_name("John Doe")
jp = Viewer.find_by_name("Jane Plain")

#Associate movies with variables
departed = Movie.find_by_title("The Departed")
in_bruges = Movie.find_by_title("In Bruges")

#Create ratings for movies
dt.create_rating(5, departed)
et.create_rating(5, departed)
jt.create_rating(4, departed)
jd.create_rating(5, in_bruges)
jp.create_rating(4, in_bruges)

Pry.start
