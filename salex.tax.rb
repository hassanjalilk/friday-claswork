class Product

	attr_accessor :price, :name, :quantity

	def initialize(name, price, quantity)
		@name = name
		@price = price
		@quantity = quantity
	end

	def itemtax
		@price * 0.10
	end
end

	class ExemptProduct < Product

		def itemtax
			@price
		end
	end

		class Onlyduty < Product

			def itemtax
				@price * 0.05
			end

		end

		class Hammered < Product

			def itemtax
		@price * 0.15
	end
	end

	class Shoppingcart

		def initialize(products)
			@products = products
			@total = 0
			@totalt = 0
		end

		def totalprice
			@products.each do |product| 
				@total += product.price
			end
			@total
		end

		def totaltax
			@products.each do |product| 
				@totalt += product.itemtax
			end
			@totalt
		end

		# def totalp


	end



	book = ExemptProduct.new("Hobbit", 12.49, 1)
  cd = Product.new("A", 16.99, 1)
  chocolate = ExemptProduct.new("Snickers", 12.49, 1)


  ichocolates = Onlyduty.new("Mars", 10, 1)
  iperfume = Onlyduty.new("Gucci", 12.49, 1)

  ibperfume = Onlyduty.new("Armani", 27.99, 1)
  boperfume = Product.new("B", 18.99, 1)
  pills = ExemptProduct.new("Pill", 9.75, 1)
  ichoco = Onlyduty.new("Icho", 11.25, 1)



  shoppingcart1 = Shoppingcart.new([book, chocolate, cd])
  puts shoppingcart1.totalprice

  shoppingcart2 = Shoppingcart.new([ichocolates, iperfume,])
  puts shoppingcart2.totalprice

  shoppingcart3 = Shoppingcart.new([ibperfume, boperfume, pills, ichoco])
  puts shoppingcart3.totalprice



  shoppingcart1t = Shoppingcart.new([book, chocolate, cd])
  puts shoppingcart1t.totaltax

  shoppingcart2t = Shoppingcart.new([ichocolates, iperfume,])
  puts shoppingcart2t.totaltax

  shoppingcart3t = Shoppingcart.new([ibperfume, boperfume, pills, ichoco])
  puts shoppingcart3t.totaltax


  # import.sales_tax






# dog = Animal.new
# cat = Animal.new

# dog.color = "Black"
# cat.color = "White"

# puts dog.color
# puts cat.color






# -------------


# class Animal

# 	attr_accessor :legs, :color

# def speak
# 		"woof #{@foo}"
# 	end

# 	def walk
# 		"I am walking"
# 	end
# end


# class Mammal < Animal

# 	attr_accessor :eyes, :sound

# 	def initialize
# 		@foo = "foo"
# 	end
# end


# class Reptile < Animal

# 	def speak
# 		"Hiss"
# 	end
# end


# lizard = Reptile.new
# lizard.color = "Green"

# human = Mamal.new
# human.color = "abc"

# ------------- Salex.tax problem ---------------
