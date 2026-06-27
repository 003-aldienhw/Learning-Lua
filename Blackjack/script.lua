math.randomseed(os.time())

local menu = true
local userFirstCard = math.random(1, 11)
local userSecondCard = math.random(1, 11)
local userTotalCard = userFirstCard + userSecondCard
local dealerFirstCard = math.random(1, 11)
local dealerSecondCard = math.random(1, 11)
local dealerTotalCard = 0
local dealerExtraCards = 0
local dealerFirstCardevent = false
local standchoice = false

function Rules()
    if userTotalCard > 21 and (userFirstCard == 11 or userSecondCard == 11) then
        userTotalCard = userTotalCard - 10
    elseif dealerTotalCard > 21 and (dealerFirstCard == 11 or dealerSecondCard == 11) then
        dealerTotalCard = dealerTotalCard - 10
    end

    if userTotalCard > 21 then
        print("\nYour cards: " .. userTotalCard)
        print("You lose. Your cards exceed 21.")
        menu = false
    elseif dealerTotalCard > 21 then
        print("\nDealer cards: " .. dealerTotalCard)
        print("You win! Dealer busts!")
        menu = false
    elseif userTotalCard == 21 then
        print("\nYour cards: " .. userTotalCard)
        print("You win! You very lucky!")
        menu = false
    elseif dealerTotalCard == 21 then
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
        userTotalCard = userTotalCard + math.random(1, 11)
        if dealerTotalCard <= 16 and userTotalCard <= 21 then
            dealerExtraCards = dealerSecondCard + math.random(1, 11)
        end
        if dealerFirstCardevent == false then
            dealerTotalCard = dealerFirstCard + dealerSecondCard
            dealerFirstCardevent = true
        elseif dealerFirstCardevent == true and dealerTotalCard <= 16 then
            dealerTotalCard = dealerTotalCard + dealerExtraCards
        end
        if dealerTotalCard <= 21 then
            print("Dealer cards: " .. dealerTotalCard)
        end
        Rules()
    elseif choice == "stand" then
        standchoice = true
        while dealerTotalCard <= 16 do
            dealerExtraCards = dealerSecondCard + math.random(1, 11)
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