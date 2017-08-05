# Boris Bikes

DockingStation
---------

Docking stations hold bikes, they have a default capacity of 20 but this can be overridden with keyword 'cap':

    docking_station = DockingStation.new

or

    docking_station = DockingStation.new some_integer
    
The docking station can be stocked with bikes:

(If no integer is passed, it will stock to capacity, however you can pass any number. note this will be clamped to 0..capacity)

    docking_station.stock_bikes
    
or

    docking_station.stock_bikes some_integer

you can show the number of bikes stocked with:

    docking_station.show_bikes
    
bikes are relesed with the following:

    docking_station.release_bike
    
or to release multiple:

    docking_station.release_bike some_integer
    
if the number of requested bikes is larger than the number available, it will not return any

bikes can be docked:

    docking_station.dock_bike bike

you can also pass 'true' to report the bike as broken:

    docking_station.dock_bike bike, true


Bike
---------

Bikes are created with the following:

  bike = Bike.new

