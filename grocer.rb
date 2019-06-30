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




def apply_coupons(cart, coupons)
i=0
puts cart.class
puts cart.length
#binding pry
  if coupons == nil
    return cart
  elsif coupons.length == 1
    cart["AVOCADO W/COUPON"] 
    while i < cart.length do
      if cart.keys[i] == coupons[0][:item]
        new_key = "#{cart.keys[i]} W/COUPON"
        cart[new_key] = (coupons[0][:cost] / coupons[0][:num])
        #cart[new_key][:price] = (coupons[i][:cost]) / coupons[0][:num]
        cart[new_key][:count] = (cart[new_key][:price] / coupons[0][:num]) * coupons[0][:num]
      end
      i += 1
    end
  end
  cart
end




def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
