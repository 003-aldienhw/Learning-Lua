local menu = true
local userFirstCard = math.random(1, 11)
local userSecondCard = math.random(1, 11)
local userTotalCard = userFirstCard + userSecondCard
local dealerFirstCard = math.random(1, 11)
local dealerSecondCard = 0
local dealerTotalCard = 0

function Rules()
    if userTotalCard > 21 then
        print("You lose. Your cards exceed 21.")
        menu = false
    elseif dealerTotalCard > 21 then
        print("You win! Dealer busts!")
        menu = false
    elseif userTotalCard == 21 then
        print("You win! You very lucky!")
        print("Your cards: " .. userTotalCard)
        menu = false
    elseif dealerTotalCard == 21 then
        print("You lose! Dealer got lucky!")
        print("Dealer cards: " .. dealerTotalCard)
        print("Your cards: " .. userTotalCard)
        menu = false
    elseif userTotalCard > 21 and (userFirstCard == 11 or userSecondCard == 11) then
        userTotalCard = userTotalCard - 10
    elseif dealerTotalCard > 21 and (dealerFirstCard == 11 or dealerSecondCard == 11) then
        dealerTotalCard = dealerTotalCard - 10
    end
end

function Inputs()
    io.write("Hit or stay?: ")
    local choice = io.read()
    if choice == "hit" then
        userTotalCard = userTotalCard + math.random(1, 11)
        dealerSecondCard = dealerSecondCard + math.random(1, 11)
        dealerTotalCard = dealerFirstCard + dealerSecondCard
        print("Dealer cards: " .. dealerTotalCard)
        Rules()
    elseif choice == "stay" then
        while dealerTotalCard <= 16 do
            dealerSecondCard = dealerSecondCard + math.random(1, 11)
            dealerTotalCard = dealerTotalCard + dealerSecondCard
        end
        if dealerTotalCard > 16 then
            if dealerTotalCard == userTotalCard then
                print("Draw!")
                print("Your cards: " .. userTotalCard)
                print("Dealer cards: " .. dealerTotalCard)
                menu = false
            elseif dealerTotalCard > userTotalCard then
                print("You lose.")
                print("Your cards: " .. userTotalCard)
                print("Dealer cards: " .. dealerTotalCard)
                menu = false
            elseif dealerTotalCard < userTotalCard then
                print("You win!")
                print("Your cards: " .. userTotalCard)
                print("Dealer cards: " .. dealerTotalCard)
                menu = false
            end
        end
        Rules()
    elseif choice == "exit" then
        print("Thanks for playing!")
        menu = false
    else
        print("Choose the right one!")
        Inputs()
    end
end

print("Dealer first card: " .. dealerFirstCard)

while menu do
    print("Your current cards: " .. userTotalCard)
    Rules()
    Inputs()
end