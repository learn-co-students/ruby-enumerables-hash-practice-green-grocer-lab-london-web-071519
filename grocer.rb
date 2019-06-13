require 'pry'

def consolidate_cart(cart)
  # code here

  cart.each do |hash|
    hash.each do |key, value|
      hash[key][:count] = 1
    end
  end
  cart
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
