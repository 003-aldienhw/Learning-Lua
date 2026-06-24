local userFirstCard = math.random(1, 11)
local userSecondCard = math.random(1, 11)
local userTotalCard = userFirstCard + userSecondCard
local dealerFirstCard = math.random(1, 11)
local dealerSecondCard = 0
local dealerTotalCard = 0

function Rules()
    if userTotalCard > 21 then
        print("You lose. Your card: " .. userTotalCard)
    elseif dealerTotalCard > 21 then
        print("You win! Dealer busts!")
    elseif userTotalCard == 21 then
        print("You win! You very lucky!")
        print("Your card: " .. userTotalCard)
    elseif dealerTotalCard == 21 then
        print("You lose! Dealer got lucky!")
        print("Your card: " .. userTotalCard)
    elseif userTotalCard > 21 and (userFirstCard == 11 or userSecondCard == 11) then
        userTotalCard = userTotalCard - 10
    else
        print("Dealer cards: " .. dealerSecondCard)
        print("Your current cards: " .. userTotalCard)
        Inputs()
    end
end

function Inputs()
    io.write("Hit or stay?: ")
    local choice = io.read()
    if choice == "hit" then
        userTotalCard = userTotalCard + math.random(1, 11)
        dealerSecondCard = dealerSecondCard + math.random(1, 11)
        dealerTotalCard = dealerFirstCard + dealerSecondCard
        Rules()
    elseif choice == "stay" then
        dealerSecondCard = dealerSecondCard + math.random(1, 11)
        dealerTotalCard = dealerFirstCard + dealerSecondCard
        Rules()
    end
end

print("Dealer card: " .. dealerFirstCard)
print("Your current cards: " .. userTotalCard)
Inputs()