
def consolidate_cart(cart)
  f = {}
  cart.map{ |x|
    x.map { |y, z|
      f[y] ||= z
      f[y][:count] ||= 0
      f[y][:count] += 1
    }
  }
f
end

def apply_coupons(cart, coupons = [])
  if coupons == []
    return cart
  end
  f = cart
    coupons.map { |co| name = co[:item]; nums = co[:num]
      if cart.include?(name) && cart[name][:count] >= nums
        f[name][:count] -= nums
        if !f["#{name} W/COUPON"]
          f["#{name} W/COUPON"] = {
            :price => co[:cost]/nums,
            :clearance => cart[name][:clearance],
            :count => nums
          }
        else
          f["#{name} W/COUPON"][:count] += nums
        end
      end
      }
f
end

def apply_clearance(cart)
  f = cart
  cart.map { |name, info|
      f[name][:price] = (f[name][:price] * 0.8).round(2) if info[:clearance] == true
  }
f
end

def checkout(cart, coupons)
  caso = consolidate_cart(cart)
  caco = apply_coupons(caso, coupons)
  cacl = apply_clearance(caco)
  t = 0
  cacl.map{ |x, y| t += (y[:price] * y[:count])}
  t = (t*0.9).round(2) if t > 100; t
end
