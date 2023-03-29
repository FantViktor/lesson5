require_relative 'instance_counter'

class Station
  include InstanceCounter
  @@stations = []
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def add_train(train)
    @trains << train
    puts "На станцию #{name} прибыл поезд №#{train.number}"
  end

  def delete_train(train)
    @trains.delete(train)
    puts "Со станции #{name} отправился поезд №#{train.number}"
  end

  def type_number
    passenger = 0
    freight = 0

    @trains.find do |train|
      if train.train_type.downcase == 'пассажирский'
        passenger += 1
      elsif train.train_type.downcase == 'грузовой'
        freight += 1
      else
        start
      end
    end

    puts "Пассажирских - #{passenger.to_s}, грузовых - #{freight.to_s}"
  end
end
