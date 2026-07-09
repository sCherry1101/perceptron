local dataset = {
{inputs={0,0}, target=0},
{inputs={0,1}, target=1},
{inputs={1,0}, target=1},
{inputs={1,1}, target=0}
}

print("--------------------------------------------------")

print("Enter w11:")
local w11 = tonumber(io.read()) or 1
print("Enter w12:")
local w12 = tonumber(io.read()) or 1
print("Enter b1:")
local b1 = tonumber(io.read()) or -0.5
print("Enter w21:")
local w21 = tonumber(io.read()) or -1
print("Enter w22:")
local w22 = tonumber(io.read()) or -1
print("Enter b2:")
local b2 = tonumber(io.read()) or 1.5
print("Enter w31:")
local w31 = tonumber(io.read()) or 1
print("Enter w32:")
local w32 = tonumber(io.read()) or 1
print("Enter b3:")
local b3 = tonumber(io.read()) or -1.5

print("--------------------------------------------------")

local function activate(z) if z > 0 then return 1 else return 0 end
end
local total_error = 0

for i = 1, #dataset do

local x1 = dataset[i].inputs[1]
local x2 = dataset[i].inputs[2]
local z1 = (x1 * w11) + (x2 * w12) + b1
local h1 = activate(z1)
local z2 = (x1 * w21) + (x2 * w22) + b2
local h2 = activate(z2)
local z3 = (h1 * w31) + (h2 * w32) + b3
local output = activate(z3)
local error = math.abs(dataset[i].target - output)
    total_error = total_error + error

print("input: (" ..x1 ..", " ..x2 ..") -> predicted: " ..output .." target: " ..dataset[i].target)
end
print("--------------------------------------------------")
print("total errors: " .. total_error)

-- the known XOR values as inputs which make 0 errors are 
-- w11 = 1
-- w12 = 1
-- b1  = -0.5
-- w21 = -1
-- w22 = -1
-- b2  = 1.5
-- w31 = 1
-- w32 = 1
-- b3  = -1.5

-- but feel free to try different values!
