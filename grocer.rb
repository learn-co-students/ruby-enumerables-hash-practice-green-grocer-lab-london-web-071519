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

  # result = {}
  # # code here#
  # cart.each do |food, info|
  #   coupons.each do |coupon|
  #     if food == coupon[:item] && info[:count] >= coupon[:num]
  #       info[:count] =  info[:count] - coupon[:num]
  #       if result["#{food} W/COUPON"]
  #         result["#{food} W/COUPON"][:count] += 1
  #       else
  #         result["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
  #       end
  #     end
  #   end
  #   result[food] = info
  # end
  # result

cart_with_coupons = {}

cart.each do |food, info|
  coupons.each do |coupon|
    if food == coupon[:item] && info[:count] >= coupon[:num]
      item_count = info[:count] = info[:count] - coupon[:num]
      cart_with_coupons[food] = info
      cart_with_coupons[food + " W/COUPON"] = {:price => (coupon[:cost] / coupon[:num]) , :clearance => true, :count => item_count}
    else
      cart_with_coupons[food] = info
    end
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
  cart_total = 0

  consolidate_cart(cart).each do |food, info|
    cart_total += info[:price]
  end
  cart_total
end
