# Story: As a programmer, I can make a vehicle.
# Hint: Test that Vehicle.new does not raise any errors.
#
# Story: As a programmer, I can make a car.
# Hint: Test that creating an instance of the new class does not raise any errors.
#
# Story: As a programmer, I can tell how many wheels a car has; default is four.
# Hint: initialize the car to have four wheels, then create a method to return the number of wheels.
#
# Story: As a programmer, I can honk the horn.
# Hint: When I call honk_horn, I get a "BEEP!".
#
# Story: As a programmer, I can make a Toyota car.
# Hint: Test that class Toyota which inherits from class Car can be created.
#
# Story: As a programmer, I can honk the horn of a Toyota car which makes the sound "whoop".
#
# Story: As a programmer, I can make a Tata car.
#
# Story: As a programmer, I can honk the horn of a Tata car - "beep".
#
# Story: As a programmer, I can make a Tesla car.
#
# Story: As a programmer, I can honk the horn of Tesla - "Beep-bee-bee-boop-bee-doo-weep".
#
# Story: As a programmer, I can tell which model year a vehicle is from. Model years never change.
# Hint: Make model year part of the initialization.
#
# Story: As a programmer, I can turn on and off the lights on a given Vehicle.
# Hint: Create method(s) to allow programmer to turn lights on and off. Which class are the methods in?
#
# Story: As a programmer, I can determine if the lights are on or off. Lights start in the off position.
#
# Story: As a programmer, I can signal left and right. Turn signals starts off.
#
# Story: As a programmer, I can determine the speed of a car. Speed starts at 0 km/h.
#
# Story: As a programmer, I can speed my Teslas up by 10 km/h per acceleration.
#
# Story: As a programmer, I can slow my Teslas down by 7 km/h per braking.
#
# Story: As a programmer, I can speed my Tatas up by 2 km/h per acceleration.
#
# Story: As a programmer, I can slow my Tatas down by 1.25 km/h per braking.
#
# Story: As a programmer, I can speed my Toyotas up by 7 km/h per acceleration.
#
# Story: As a programmer, I can slow my Toyotas down by 5 km/h per braking.
#
# Story: As a programmer, I can call upon a car to tell me all it's information.
# Hint: Implement to_s on one or more classes. You can call a super class's to_s with super.
#
# Story: As a programmer, I can store and retrieve all of my cars from a garage.
# Hint: "Garage" is a noun, "store" and "retrieve" are verbs.
#
# Story: As a programmer, I can sort the cars in my garage based on model year.
#
# Story: As a programmer, I can sort the cars in my garage based on model.
# Hint: Sort based on class name.
#
# Story: As a programmer, I can sort the cars in my garage based on model and then year.
# Hint: Find out how the spaceship operator can help you with an array.


class Vehicle

  def initialize modelyear
    @lights = "off"
    @signal = "off"
    @modelyear = modelyear
  end

  def lights
    @lights
  end

  def signal
    @signal
  end

  def modelyear
    @modelyear
  end

  def signalLeft
    if(@signal == "off")
      @signal = "left"
    else
      @signal = "off"
    end
  end

  def signalRight
    if(@signal == "off")
      @signal = "right"
    elsif @signal == "left" #if the signal is already left and you want to make it right
      @signal = "right"
    else
      @signal = "off"
    end
  end

  def toggleLights
    if @lights == "off"
      @lights = "on"
    else
      @lights = "off"
    end
  end

end

class Car < Vehicle

  def initialize modelyear # Whernever you do Car.new, pass in a model year with it, i.e. Car.new("2020")
    super(modelyear)
    @wheels = 4
    @honk_horn = "BEEP!"
    @speed = 0
  end

  def wheels
    @wheels
  end

  def honk_horn
    @honk_horn
  end

  def modelyear
    @modelyear
  end

  def speed
    @speed
  end

  def to_s
    "This car has #{wheels} wheels, it's lights are #{lights}, the horn is #{honk_horn}, and it is a #{modelyear} #{self.class}."
  end
end



class Toyota < Car
    def initialize modelyear
      super(modelyear)
      @honk_horn="whoop"
    end

    def speedup
      @speed+=7
    end

    def speeddown
      @speed-=5
    end

end

class Tata < Car
    def initialize modelyear
      super(modelyear)
      @honk_horn="beep"
    end

    def speedup
      @speed+=2
    end

    def speeddown
      @speed-=1.25
    end

  end

class Tesla < Car
    def initialize modelyear
      super(modelyear)
      @honk_horn="Beep-bee-bee-boop-bee-doo-weep"
    end

    def speedup
      @speed+=10
    end

    def speeddown
      @speed-=7
    end
end

class Garage
  def initialize
    @garage = []
  end

  def store car #adds a car to the garage
    #takes in an argument
    #adds that argument to garage
    @garage << car
  end

  def garage
    @garage
  end

  


end

g = Garage.new

g.store(Tesla.new(2020)) #stores a car in our Garage
g.store(Tata.new(1999))
g.store(Toyota.new(1888))

puts g.garage
# g.retrieve "Tesla" #=> Returns the 2020 tesla
