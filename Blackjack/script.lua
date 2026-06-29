math.randomseed(os.time())

local menu = true
local userFirstCard = math.random(1, 11)
local userSecondCard = math.random(1, 11)
local userExtraCards = math.random(1, 11)
local userTotalCard = userFirstCard + userSecondCard
local userAce = 0
local dealerFirstCard = math.random(1, 11)
local dealerSecondCard = math.random(1, 11)
local dealerExtraCards = math.random(1, 11)
local dealerTotalCard = dealerFirstCard + dealerSecondCard
local dealerAce = 0
local dealerFirstCardEvent = false
local standchoice = false

function Rules()
    if userExtraCards == 11 then
        userAce = userAce + 1
    elseif dealerExtraCards == 11 then
        dealerAce = dealerAce + 1
    end
    while userTotalCard > 21 and userAce > 0 do
        userTotalCard = userTotalCard - 10
        userAce = userAce - 1
    end
    while dealerTotalCard > 21 and dealerAce > 0 do
        dealerTotalCard = dealerTotalCard - 10
        dealerAce = dealerAce - 1
    end

    if userTotalCard > 21 then
        print("\nYour cards: " .. userTotalCard)
        print("You lose. Your cards exceed 21.")
        menu = false
    elseif dealerTotalCard > 21 and dealerFirstCardEvent == true then
        print("\nDealer cards: " .. dealerTotalCard)
        print("You win! Dealer busts!")
        menu = false
    elseif userTotalCard == 21 then
        print("\nYour cards: " .. userTotalCard)
        print("You win! You very lucky!")
        menu = false
    elseif dealerTotalCard == 21 and dealerFirstCardEvent == true then
        print("\nDealer cards: " .. dealerTotalCard)
        print("Your cards: " .. userTotalCard)
        print("You lose! Dealer got lucky!")
        menu = false
    elseif dealerTotalCard > 16 and standchoice == true then
        if dealerTotalCard == userTotalCard then
            print("\nYour cards: " .. userTotalCard)
            print("Dealer cards: " .. dealerTotalCard)
            print("Draw!")
            menu = false
        elseif dealerTotalCard > userTotalCard and dealerTotalCard <= 21 then
            print("\nYour cards: " .. userTotalCard)
            print("Dealer cards: " .. dealerTotalCard)
            print("You lose.")
            menu = false
        elseif dealerTotalCard < userTotalCard and userTotalCard <= 21 then
            print("\nYour cards: " .. userTotalCard)
            print("Dealer cards: " .. dealerTotalCard)
            print("You win!")
            menu = false
        end
    elseif dealerTotalCard > 16 and (dealerTotalCard < userTotalCard or dealerTotalCard == userTotalCard) then
        if dealerTotalCard == userTotalCard then
            print("\nYour cards: " .. userTotalCard)
            print("Dealer cards: " .. dealerTotalCard)
            print("Draw!")
            menu = false
        elseif dealerTotalCard > userTotalCard and dealerTotalCard <= 21 then
            print("\nYour cards: " .. userTotalCard)
            print("Dealer cards: " .. dealerTotalCard)
            print("You lose.")
            menu = false
        elseif dealerTotalCard < userTotalCard and userTotalCard <= 21 then
            print("\nYour cards: " .. userTotalCard)
            print("Dealer cards: " .. dealerTotalCard)
            print("You win!")
            menu = false
        end
    end
end

Rules()
print("Dealer first card: " .. dealerFirstCard)

while menu do
    Rules()
    print("Your current cards: " .. userTotalCard)
    io.write("Hit or stand?: ")
    local choice = io.read()
    if choice == "hit" then
        dealerFirstCardEvent = true
        userTotalCard = userTotalCard + userExtraCards
        if dealerTotalCard <= 16 and userTotalCard <= 21 then
            dealerTotalCard = dealerTotalCard + dealerExtraCards
        end
        if dealerTotalCard <= 21 then
            print("Dealer cards: " .. dealerTotalCard)
        end
        Rules()
    elseif choice == "stand" then
        standchoice = true
        dealerFirstCardEvent = true
        while dealerTotalCard <= 16 do
            dealerTotalCard = dealerTotalCard + dealerExtraCards
        end
        Rules()
    elseif choice == "exit" then
        print("Thanks for playing!")
        menu = false
    else
        print("Choose the right one!")
    end
end