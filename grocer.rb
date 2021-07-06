require "pry"

def consolidate_cart(cart)
i = 0
while i < cart.length do
  #puts cart[0][cart[0].keys[0]]
  #puts [cart[0].keys].class

  if cart[i][cart[i].keys[0]][:count] == nil
    cart[i][cart[i].keys[0]][:count] = 1
  else
    cart[i][cart[i].keys[0]][:count] += 1
  end

  #puts cart[i][cart[i].keys[0]][:count]
  #puts cart[i].keys
  i += 1

end

final_hash = Hash[*cart.collect{|h| h.to_a}.flatten]
final_hash
end


def apply_coupons(cart, coupons=[])
  coupons.each do |coupon|
    if cart.keys.include?(coupon[:item])
      if cart[coupon[:item]][:count] >= coupon[:num]
        new_key = "#{coupon[:item]} W/COUPON"
        if cart[new_key]
          cart[new_key][:count] += coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
        else
          cart[new_key] = {}
          cart[new_key][:price] = (coupon[:cost] / coupon[:num])
          cart[new_key][:clearance] = cart[coupon[:item]][:clearance]
          cart[new_key][:count] = coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
        end
      end
    end
  end

  cart
end


def apply_clearance(cart)
  #puts cart.class
  #puts cart.keys
  cart.each do |n|
    if n[1][:clearance] == true
      n[1][:price] = (n[1][:price])*4/5
    end
  end
end



def checkout(cart, coupons)
  new_cart = consolidate_cart(cart)
  new_cart = apply_coupons(new_cart, coupons)
  apply_clearance(new_cart)



sum = 0
new_cart.keys.each do |the_cart|
  puts the_cart
  puts new_cart[the_cart]
  sum += new_cart[the_cart][:price] * new_cart[the_cart][:count]
end








  #i = 0
  #sum = 0
  #while i < cart.length do
  #  sum += new_cart[new_cart.keys[i]][:price]
  #  i += 1
  #end
  if sum > 100
    sum = (sum*9)/10
  end

  sum


end
