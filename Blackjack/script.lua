math.randomseed(os.time())

local menu = true
local deck = {
    11, 11, 11, 11,
    2, 2, 2, 2,
    3, 3, 3, 3,
    4, 4, 4, 4,
    5, 5, 5, 5,
    6, 6, 6, 6,
    7, 7, 7, 7,
    8, 8, 8, 8,
    9, 9, 9, 9,
    10, 10, 10, 10,
    10, 10, 10, 10,
    10, 10, 10, 10,
    10, 10, 10, 10
}
local userCards = {}
local dealerCards = {}
local userAce = 0
local dealerAce = 0
local dealerFirstCardEvent = false
local standchoice = false

function DrawCard()
    local card = math.random(1, #deck)
    return table.remove(deck, card)
end

function CalculateTotal(t)
    local total = 0
    for key, value in pairs(t) do
        if type(value) == "number" then
            total = total + value
        end
    end
    return total
end

table.insert(userCards, DrawCard())
table.insert(userCards, DrawCard())
table.insert(dealerCards, DrawCard())
table.insert(dealerCards, DrawCard())

local totalUserCards = CalculateTotal(userCards)
local totalDealerCards = CalculateTotal(dealerCards)

function Rules()
    userAce = 0
    for index, value in ipairs(userCards) do
        if value == 11 then
            userAce = userAce + 1
        end
        if totalUserCards > 21 and userAce > 0 then
            totalUserCards = totalUserCards - 10
            userAce = userAce - 1
        end
    end

    dealerAce = 0
    for index, value in ipairs(dealerCards) do
        if value == 1 then
            dealerAce = dealerAce + 1
        end
        if totalDealerCards > 21 and dealerAce > 0 then
            totalDealerCards = totalDealerCards - 10
            dealerAce = dealerAce - 1
        end
    end

    if totalUserCards > 21 then
        print("\nYour cards: " .. totalUserCards)
        print("You lose. Your cards exceed 21.")
        menu = false
    elseif totalDealerCards > 21 and dealerFirstCardEvent == true then
        print("\nDealer cards: " .. totalDealerCards)
        print("You win! Dealer busts!")
        menu = false
    elseif totalUserCards == 21 then
        print("\nYour cards: " .. totalUserCards)
        print("You win! You very lucky!")
        menu = false
    elseif totalDealerCards == 21 and dealerFirstCardEvent == true then
        print("\nDealer cards: " .. totalDealerCards)
        print("Your cards: " .. totalUserCards)
        print("You lose! Dealer got lucky!")
        menu = false
    elseif totalDealerCards > 16 and standchoice == true then
        if totalDealerCards == totalUserCards then
            print("\nYour cards: " .. totalUserCards)
            print("Dealer cards: " .. totalDealerCards)
            print("Draw!")
            menu = false
        elseif totalDealerCards > totalUserCards and totalDealerCards <= 21 then
            print("\nYour cards: " .. totalUserCards)
            print("Dealer cards: " .. totalDealerCards)
            print("You lose.")
            menu = false
        elseif totalDealerCards < totalUserCards and totalUserCards <= 21 then
            print("\nYour cards: " .. totalUserCards)
            print("Dealer cards: " .. totalDealerCards)
            print("You win!")
            menu = false
        end
    elseif totalDealerCards > 16 and (totalDealerCards < totalUserCards or totalDealerCards == totalUserCards) then
        if totalDealerCards == totalUserCards then
            print("\nYour cards: " .. totalUserCards)
            print("Dealer cards: " .. totalDealerCards)
            print("Draw!")
            menu = false
        elseif totalDealerCards > totalUserCards and totalDealerCards <= 21 then
            print("\nYour cards: " .. totalUserCards)
            print("Dealer cards: " .. totalDealerCards)
            print("You lose.")
            menu = false
        elseif totalDealerCards < totalUserCards and totalUserCards <= 21 then
            print("\nYour cards: " .. totalUserCards)
            print("Dealer cards: " .. totalDealerCards)
            print("You win!")
            menu = false
        end
    end
end

Rules()
print("Dealer first card: " .. dealerCards[1])

while menu do
    Rules()
    print("Your current cards: " .. totalUserCards)
    io.write("Hit or stand?: ")
    local choice = io.read()
    if choice == "hit" then
        dealerFirstCardEvent = true
        table.insert(userCards, DrawCard())
        totalUserCards = CalculateTotal(userCards)
        if totalDealerCards <= 16 and totalUserCards <= 21 then
            table.insert(dealerCards, DrawCard())
            totalDealerCards = CalculateTotal(dealerCards)
        end
        if totalDealerCards <= 21 then
            print("Dealer cards: " .. totalDealerCards)
        end
        Rules()
    elseif choice == "stand" then
        standchoice = true
        dealerFirstCardEvent = true
        while totalDealerCards <= 16 do
            table.insert(dealerCards, DrawCard())
            totalDealerCards = CalculateTotal(dealerCards)
        end
        Rules()
    elseif choice == "exit" then
        print("Thanks for playing!")
        menu = false
    else
        print("Choose the right one!")
    end
end