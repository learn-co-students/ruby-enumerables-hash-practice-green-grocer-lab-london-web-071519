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
cart_with_coupons = {}

  if coupons.length == 0
    return cart
  else
    cart.each do |food, info|
      coupons.each do |coupon|
        # binding.pry
        if food == coupon[:item] && info[:count] >= coupon[:num]
          info[:count] = info[:count] - coupon[:num]
          if cart_with_coupons[food + " W/COUPON"]
            cart_with_coupons[food + " W/COUPON"][:count] += coupon[:num]
          else
            cart_with_coupons[food + " W/COUPON"] = {:price => (coupon[:cost] / coupon[:num]) , :clearance => info[:clearance], :count => coupon[:num]}
          end
        else
          cart_with_coupons[food] = info
        end
      end
      cart_with_coupons[food] = info
    end
  end
cart_with_coupons
end

def apply_clearance(cart)
  # code here
  clearance_cart = {}

  cart.each do |food, info|
    if info[:clearance] == true
      clearance_cart[food] = {:price => ((info[:price] / 5.00) * 4.00), :clearance => info[:clearace], :count => info[:count]}
    else
      clearance_cart[food] = info
    end
  end
  clearance_cart
end

def checkout(cart, coupons)
  # code here
  # binding.pry
  cart_total = 0
  consolidated_cart = consolidate_cart(cart)
  # binding.pry
  cart_with_coupons_applied = apply_coupons(consolidated_cart, coupons)
  # binding.pry
  cart_with_coupons_clearance_applied = apply_clearance(cart_with_coupons_applied)
  # binding.pry

  cart_with_coupons_clearance_applied.each do |food, info|
    # binding.pry
    cart_total += info[:price] * info[:count]
  end

  cart_total > 100 ? cart_total * 0.9 : cart_total

end
