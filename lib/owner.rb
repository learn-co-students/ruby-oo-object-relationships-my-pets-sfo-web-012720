require 'pp'

class Owner

  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end
  
  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

  def cats

    output = []

    for cat in Cat.all

      if cat.owner === self
  
        output << cat

      end

    end

    output

  end

  def dogs

    output = []

    for dog in Dog.all

      if dog.owner === self
  
        output << dog

      end

    end
    
    output

  end

  def buy_cat(name)

    Cat.new(name, self)
    
  end

  def buy_dog(name)

    Dog.new(name, self)

  end

  def walk_dogs
    
    for dog in dogs

      dog.mood = "happy"

    end

  end

  def feed_cats

    for cat in cats

      cat.mood = "happy"

    end

  end

  def sell_pets

    data = dogs + cats
    
    for pet in data

      pet.mood = "nervous"
      pet.owner = nil

    end

  end

  def list_pets

    dogData = dogs.size
    catData = cats.size

    "I have #{dogData} dog(s), and #{catData} cat(s)."

  end

end