local Connection   = {}
Connection.__index = Connection

function Connection.new(inNeuron, outNeuron, weight)
   local connection = setmetatable({
      inNeuron  = inNeuron,
      outNeuron = outNeuron,
      weight    = weight or love.math.random(0, 1),
      buffer    = 0,
   }, Connection)

   table.insert(inNeuron.outputs, connection)
   table.insert(outNeuron.inputs, connection)

   return connection
end

function Connection:push(value)
   self.buffer = self.weight * value
end

function Connection:pop()
   local v = self.buffer
   self.buffer = 0
   return v
end

function Connection:peek()
   return self.buffer
end

return setmetatable(Connection, {
   __call = function(_, ...) return Connection.new(...) end,
})
