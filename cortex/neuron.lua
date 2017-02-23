local Path       = (...):gsub('%.[^%.]+$', '')
local Connection = require(Path..".connection")
local Activation = require(Path..".activation")

local Neuron   = {}
Neuron.__index = Neuron

function Neuron.new(isBiased)
   local neuron = {
      inputs   = {},
      outputs  = {},
      value    = (isBiased and 1) or 0,
      isBiased = isBiased,
   }

   return neuron
end

function Neuron:activate()
   if not self.isBiased then
      local temp_value = 0
      for _, connection in ipairs(self.inputs) do
         temp_value = temp_value + connection:pop()
      end

      self.value = Activation.sigmoid(temp_value)
   end
end

function Neuron:connectTo(target)
   Connection(self, target)
end

function Neuron:connectFrom(target)
   Connection(target, self)
end

return setmetatable(Neuron, {
   __call = function(_, ...) return Neuron.new(...) end,
})
