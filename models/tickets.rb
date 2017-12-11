require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :sold_date

  def initialize (options)
    @id = options['id'].to_i
    @customer_id = options['customer_id']
    @film_id = options['film_id']
    @sold_date = options['sold_date']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, sold_date)
          VALUES ($1, $2, $3)
          RETURNING id"
    values = [@customer_id, @film_id, @sold_date]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets
           SET (customer_id, film_id, sold_date) = ($1, $2, $3)
           WHERE id = $4"
    values = [@customer_id, @film_id, @sold_date, @id]
    SqlRunner.run(sql, values)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    customer_hash = SqlRunner.run(sql, values)[0]
    return Customer.new(customer_hash)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    film_hash = SqlRunner.run(sql, values)[0]
    return Film.new(film_hash)
  end


  #-------SEPERATING CLASS METHODS AND INSTANCE METHODS-------------------------#

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket_hashes = SqlRunner.run(sql)
    return Ticket.map_items(ticket_hashes)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(ticket_hashes)
    result = ticket_hashes.map {|ticket_hash| Ticket.new(ticket_hash)}
    return result
  end


end
