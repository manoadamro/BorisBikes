# Errors are Good

### Input:

docking_station = DockingStation.new

### Error:
NameError: uninitialized constant DockingStation
	from (irb):1
	from /usr/bin/irb:12:in <main>


### Error Type:
NameError

### Message:
uninitialized constant

### Path:
/usr/bin/irb:12:in

### Error Number:
1

### Meaning:

We are trying to initialize a class called DockingStation but this class has not yet been defined.


### Solution:
	
Define a class called DockingStation with an initialize method.
