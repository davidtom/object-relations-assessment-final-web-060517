# Please copy/paste all three classes into this file to submit your solution!
## Movie
class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    all.find{|movie| movie.title == title}
  end

  def ratings
    Rating.all.select{|rating| rating.movie == self}
  end

  def viewers
    ratings.collect{|rating| rating.viewer}
  end

  def average_rating
    scores_array = ratings.collect{|rating| rating.score.to_f}
    scores_sum = scores_array.inject(:+)
    scores_sum / scores_array.length
  end

end

## Rating
class Rating
  attr_accessor :score, :viewer
  attr_reader :movie

  @@all = []

  def initialize(score, movie)
    @score = score
    @movie = movie
    self.class.all << self
  end

  def self.all
    @@all
  end

end

## Viewer
class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    self.class.all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.find{|user| user.full_name == name}
  end

  def create_rating(score, movie)
    rating = Rating.new(score, movie)
    rating.viewer = self
  end

end
