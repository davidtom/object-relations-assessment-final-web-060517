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
