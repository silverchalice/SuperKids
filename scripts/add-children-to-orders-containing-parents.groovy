import com.superkids.domain.*

def pOrders = ProductOrder.findAllByProduct(Product.get(15))

def orders = []
pOrders.each {
  if(CustomerOrder.exists(it.orderId)) {
    orders << it.order
  }
}

def child1 = Product.get(65)
def child2 = Product.get(66)
def child3 = Product.get(67)

def total = orders.size()
def count = 0

orders.each { order ->
  count++
  println "Updating order $count of $total"

  def products = order.products.collect { it.product }

  if(!products.contains(child1)) new ProductOrder(order: order, product: child1).save(flush:true)
  if(!products.contains(child2)) new ProductOrder(order: order, product: child2).save(flush:true)
  if(!products.contains(child3)) new ProductOrder(order: order, product: child3).save(flush:true)
  
}