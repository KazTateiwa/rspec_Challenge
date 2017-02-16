require 'rspec'
require_relative 'car'

describe Vehicle do
  it "has to be able to create a Vehicle object" do
    expect{Vehicle.new("2020")}.to_not raise_error
  end

  it "stats with its lights off" do
    expect(Vehicle.new("2020").lights).to eq("off")
  end

end

describe Car do
  it "has to be able to create a Car object" do
    expect{Car.new("2020")}.to_not raise_error
  end

  it "has to have four wheels" do
    expect(Car.new("2020").wheels).to eq(4)
  end

  it "has to say 'BEEP!' when we honk the horn" do
    expect(Car.new("2020").honk_horn).to eq("BEEP!")
  end

end

describe Toyota do
  it "has to be able to create a Toyota object" do
    expect{Toyota.new("2020")}.to_not raise_error
  end

  it "has to say 'whoop' when we honk the horn" do
    expect(Toyota.new("2020").honk_horn).to eq("whoop")
  end

  it "has to have a superclass Car" do
      expect(Toyota.new("2020").class.superclass).to eq(Car)
  end

  it "increment speed of Toyota by 7 per acceleration" do
    expect(Toyota.new("2020").speedup).to eq(7)
  end

  it "decrement speed of Tata by 5 per acceleration" do
    expect(Toyota.new("2020").speeddown).to eq(-5)
  end

end

describe Tata do
it "has to be able to creare a Tata object" do
    expect{Tata.new("2020")}.to_not raise_error
  end

it "has to say 'beep'" do
    expect(Tata.new("2020").honk_horn).to eq("beep")
end

it "increment speed of Tata by 2 per acceleration" do
  expect(Tata.new("2020").speedup).to eq(2)
end

it "decrement speed of Tata by 1.25 per brake" do
  expect(Tata.new("2020").speeddown).to eq(-1.25)
end

end

describe Tesla do
  it "has to create a Tesla object" do
      expect{Tesla.new("2020")}.to_not raise_error
  end

  it "has to say (Beep-bee-bee-boop-bee-doo-weep)" do
      expect(Tesla.new("2020").honk_horn).to eq("Beep-bee-bee-boop-bee-doo-weep")
  end

  it "has a model year" do
    expect(Tesla.new("2020").modelyear).to eq("2020")
  end

  it "starts with its lights off" do
    expect(Tesla.new("2020").lights).to eq("off")
  end

  it "toggles the lights on and off" do
    t = Tesla.new("2020")
    expect(t.toggleLights).to eq("on")
    expect(t.toggleLights).to eq("off")
  end

  it "toggles the turn signal left and right" do
    t = Tesla.new("2020")
    expect(t.signalLeft).to eq("left") #signal => "right", if "off", make "left"
    expect(t.signalRight).to eq("right")
  end

  it "set veh speed to 0" do
    expect(Car.new("2020").speed).to eq(0)
  end

  it "increment speed of Tesla by 10 per acceleration" do
    expect(Tesla.new("2020").speedup).to eq(10)
  end

  it "decrement speed of Tesla by 7 per brake" do
    expect(Tesla.new("2020").speeddown).to eq(-7)
  end

  it "has a nice to string method" do
      expect(Tesla.new("2020").to_s).to eq("This car has 4 wheels, it's lights are off, the horn is Beep-bee-bee-boop-bee-doo-weep, and it is a 2020 Tesla.")
  end
end

describe Garage do
  it "can store and retrieve cars" do
    my_garage = Garage.new
    my_car = Car.new("1970")
    my_garage.store(my_car)
    expect(my_garage.garage).to include(my_car)
  end

  it "can sort the cars in my garage based on model year" do
    my_garage = Garage.new
    my_tesla = Tesla.new(1999)
    my_tesla2 = Tesla.new(2050)
    my_tesla3 = Tesla.new(1954)
    my_garage.store(my_tesla)
    my_garage.store(my_tesla2)
    my_garage.store(my_tesla3)
    expect(my_garage.garage.sort{|car1, car2| car1.modelyear <=> car2.modelyear}[0]).to eq(my_tesla3)
  end

  it "can sort the cars in my garage based on model" do
    my_garage = Garage.new
    my_tesla = Tesla.new(1999)
    my_tesla2 = Tata.new(2050)
    my_tesla3 = Toyota.new(1954)
    my_garage.store(my_tesla)
    my_garage.store(my_tesla2)
    my_garage.store(my_tesla3)
      expect(my_garage.garage.sort{|car1, car2| car1.class.to_s <=> car2.class.to_s}[0]).to eq(my_tesla2)
  end

  it "can sort the cars in my garage based on model then year" do
    my_garage = Garage.new
    my_tesla = Tesla.new(1999)
    my_tesla2 = Tesla.new(1889)
    my_tata = Tata.new(2050)
    my_tata2 = Tata.new(1999)
    my_tesla3 = Toyota.new(1954)
    my_garage.store(my_tesla)
    my_garage.store(my_tesla2)
    my_garage.store(my_tesla3)
    my_garage.store(my_tata)
    my_garage.store(my_tata2)
      expect(my_garage.garage.sort_by{|car1| [car1.class.to_s, car1.modelyear]}[0]).to eq(my_tata2)
  end
end
