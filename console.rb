require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

require( 'pry-byebug' )

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({ 'name' => 'Robert', 'funds' => 40})
customer1.save()
customer2 = Customer.new({ 'name' => 'John', 'funds' => 30})
customer2.save()
customer3 = Customer.new({ 'name' => 'Alex', 'funds' => 20})
customer3.save()
customer4 = Customer.new({ 'name' => 'Craig', 'funds' => 10})
customer4.save()
# binding.pry


film1 = Film.new({ 'title' => 'Home Alone 2', 'price' => 5})
film1.save()
film2 = Film.new({ 'title' => 'Muppets Christmas Carol', 'price' => 7})
film2.save()
film3 = Film.new({ 'title' => 'Miracle On 34th Street', 'price' => 10})
film3.save()
film4 = Film.new({ 'title' => 'Jingle All The Way', 'price' => 12})
film4.save()
# binding.pry

ticket1 = Ticket.new({ 'customer_id' =>customer1.id, 'film_id' => film1.id, 'sold_date' => 'December 20 2017'})
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' =>customer2.id, 'film_id' => film2.id, 'sold_date' => 'December 21 2017'})
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' =>customer3.id, 'film_id' => film1.id, 'sold_date' => 'December 22 2017'})
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' =>customer1.id, 'film_id' => film3.id, 'sold_date' => 'December 23 2017'})
ticket4.save()
ticket5 = Ticket.new({ 'customer_id' =>customer2.id, 'film_id' => film3.id, 'sold_date' => 'December 24 2017'})
ticket5.save()
ticket6 = Ticket.new({ 'customer_id' =>customer3.id, 'film_id' => film3.id, 'sold_date' => 'December 24 2017'})
ticket6.save()

# customer1.name = "Steve"
# customer1.update
# customer1 = Customer.all()

# 
# "customer1.film" in pry returns the result that
# customer1 (Robert) is going to see Home Alone 2
# & Miracle On 34th Street
#
# "film1.customer" in pry returns the result that
# film 1 (Home Alone 2) is being seen by both
# Robert & Alex

binding.pry
nil
