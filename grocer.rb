require 'pry'

def consolidate_cart(cart)
  # code here
  new_hash = {}
  cart.each do |hash|
    hash.each do |key, value|
      binding.pry
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
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
