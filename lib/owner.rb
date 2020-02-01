class Owner
  attr_accessor :dog, :cat, :owner
  attr_reader :name, :species
  
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def species(species="human")
    @species = species
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.select {|cat| cat.mood = "happy"}
  end

  def sell_pets
    Cat.all.select {|cat| cat.mood = "nervous"}
    Cat.all.select {|cat| cat.owner = nil}
    Dog.all.select {|dog| dog.mood = "nervous"}
    Dog.all.select {|dog| dog.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end