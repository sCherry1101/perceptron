local dataset = {
{inputs={0,0}, target=0},
{inputs={0,1}, target=0},
{inputs={1,0}, target=0},
{inputs={1,1}, target=1}
}

-- run ```lua slp.lua```

print("NOTE: The next input will be weight 1-2 , bias and learning rate. Enter float values from 0-1 and if the value is not float value then the value will be 0.1 by default")

print("-----------------------------------------------------------------")

print("enter initial weight 1 :")
local w1 = tonumber(io.read()) or 0.1

print("enter initial weight 2 :")
local w2 = tonumber(io.read()) or 0.1

print("enter initial bias :")
local bias = tonumber(io.read()) or 0.1

print("enter learning rate :")
local lr = tonumber(io.read()) or 0.1

local function activate(z)
if z > 0 then return 1 else return 0 end
end

for epoch = 1, 50 do
local total_error = 0

for i = 1, #dataset do
local x1 = dataset[i].inputs[1]
local x2 = dataset[i].inputs[2]
local target = dataset[i].target
local z = (x1 * w1) + (x2 * w2) + bias
local guess = activate(z)
local error = target - guess

w1 = w1 + (lr * error * x1)
w2 = w2 + (lr * error * x2)
bias = bias + (lr * error)

if error ~= 0 then
  total_error = total_error + 1
end
end

if total_error == 0 then
    print("converged at epoch: " .. epoch)
    break
  end
end

print("final weights: w1=" .. w1 .. ", w2=" .. w2 .. ", bias=" .. bias)
print("-----------------------------------------------------------------")

for i = 1, #dataset do
local x1 = dataset[i].inputs[1]
local x2 = dataset[i].inputs[2]
local z = (x1 * w1) + (x2 * w2) + bias
local result = activate(z)

print("input: " .. x1 .. ", " .. x2 .. " predicted: " .. result .. "  target: " .. dataset[i].target)
end
