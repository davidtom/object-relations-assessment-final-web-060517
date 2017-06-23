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
