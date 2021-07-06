def consolidate_cart(cart)
  # cart is an array of hashes
  newCart = {}

  cart.each do |k| 
  
    if newCart[k.keys[0]]
      newCart[k.keys[0]][:count] += 1
    else
      newCart[k.keys[0]] = k[k.keys[0]]
      newCart[k.keys[0]][:count] = 1
    end
  end
  newCart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.keys.include?(coupon[:item])
      if cart[coupon[:item]][:count] >= coupon[:num]
        itemwithCoupon = "#{coupon[:item]} W/COUPON"
        if cart[itemwithCoupon]
          cart[itemwithCoupon][:count] += coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
        else
          cart[itemwithCoupon] = {}
          cart[itemwithCoupon][:price] = (coupon[:cost] / coupon[:num])
          cart[itemwithCoupon][:clearance] = cart[coupon[:item]][:clearance]
          cart[itemwithCoupon][:count] = coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
        end
      end
    end
  end
  cart

end

def apply_clearance(cart)
  
  cart.each do |item|
    if item[1][:clearance] == true
      item [1][:price] = (item[1][:price] * 0.80).round(2)
    end
  end
  cart
end


def checkout(cart, coupons)
  
  newCart = consolidate_cart(cart)
  appliedCoupons = apply_coupons(newCart, coupons)
  withClearance = apply_clearance(appliedCoupons)
  total = 0
  
  withClearance.each do |item|
    total += item[1][:price] * item[1][:count]
    #price multiplied by quantity
    #total += (quanity * price)
    #if total is above 100, apply 10% discount
  end
  if total > 100
    total = total * 0.9
  end
  return total
end