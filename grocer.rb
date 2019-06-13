require 'pry'

def consolidate_cart(cart)
  # code here
  new_hash = {}
  cart.each do |hash|
    hash.each do |key, value|
      if new_hash[key]
        new_hash[key][:count] += 1
      else
        new_hash[key] = value
        new_hash[key][:count] = 1
      end
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  # code here

  coupons.each do |discount_product|
    if discount_product[:item] == cart.each_with_index do |product, index|
      product[1][:count] -= discount_product[:num]
      end
    end
  end
  cart
end

# discount_product = {:item=>"AVOCADO", :num=>2, :cost=>5.0}
# product = ["AVOCADO", {:price=>3.0, :clearance=>true, :count=>2}]


def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
