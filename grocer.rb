def consolidate_cart(cart)
  # Get the count for each occurrence of hash, add as key value pair and store:
h = cart.uniq.each { |x| x[x.first.first][:count] = cart.count(x) }

# Then convert hashes into arrays, flatten to a single array then construct a hash:
new_cart = Hash[*h.collect(&:to_a).flatten]
return new_cart

end

def apply_coupons(cart, coupons)
  # code here
  i=0
  j=0


  #binding pry
    if coupons == nil #if no coupons were provided
      return cart

    elsif coupons.length == 1
        while i < cart.length do
          if cart.keys[i] == coupons[0][:item]
            match = true
            new_key = "#{cart.keys[i]} W/COUPON"
            cart[new_key] = {}
            cart[new_key][:price] = (coupons[0][:cost] / coupons[0][:num])
            counter_val = coupons[0][:num]
            cart[new_key][:count] = counter_val
            cart[cart.keys[i]][:count] -= counter_val
              if cart[cart.keys[i]][:clearance] == true
                cart[new_key][:clearance] = true
              else
                cart[new_key][:clearance] = false
              end
            end
            i += 1
          end
          if match == false #if coupon didnt match any cart items
            cart["ITEM NAME W/COUPON"]
          end
          return cart

  end # method close

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
