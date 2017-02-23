local Activation = {}

function Activation.identity(x)
   return x
end

function Activation.binary_step(x)
   if x > 0 then
      return 1
   end
   return -1
end

function Activation.sigmoid(x)
   return 1 / (1 + math.exp(-x))
end

return Activation
