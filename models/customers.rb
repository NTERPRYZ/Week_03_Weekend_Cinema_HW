require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
          VALUES ($1, $2)
          RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers
           SET (name, funds) = ($1, $2)
           WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def film()
    sql = "SELECT DISTINCT films.*
    FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE tickets.customer_id = $1;"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    return Film.map_items(film_hashes)
  end

  def buy_ticket
    
  end

#-------SEPERATING CLASS METHODS AND INSTANCE METHODS-------------------------#

  def self.all()
    sql = "SELECT * FROM customers"
    customer_hashes = SqlRunner.run(sql)
    return Customer.map_items(customer_hashes)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(customer_hashes)
    result = customer_hashes.map {|customer_hash| Customer.new(customer_hash)}
    return result
  end



end
