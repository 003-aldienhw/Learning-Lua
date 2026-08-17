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
local dealerRevealed = false
local standchoice = false
local done = false

function DrawCard()
    local card = math.random(1, #deck)
    return table.remove(deck, card)
end

function CalculateTotal(t)
    local total = 0
    for _, value in pairs(t) do
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
    for _, value in ipairs(userCards) do
        if value == 11 then
            userAce = userAce + 1
        end
    end

    while totalUserCards > 21 and userAce > 0 do
        totalUserCards = totalUserCards - 10
        userAce = userAce - 1
    end

    dealerAce = 0
    for _, value in ipairs(dealerCards) do
        if value == 11 then
            dealerAce = dealerAce + 1
        end
    end

    while totalDealerCards > 21 and dealerAce > 0 do
        totalDealerCards = totalDealerCards - 10
        dealerAce = dealerAce - 1
    end

    if totalUserCards > 21 then
        print("\nYour cards: " .. totalUserCards)
        print("You lose. Your cards exceed 21.")
        menu = false
        done = true
    elseif totalDealerCards > 21 and dealerRevealed == true then
        print("\nDealer cards: " .. totalDealerCards)
        print("You win! Dealer busts!")
        menu = false
        done = true
    elseif totalUserCards == 21 then
        print("\nYour cards: " .. totalUserCards)
        print("You win! You very lucky!")
        menu = false
        done = true
    elseif totalDealerCards == 21 and dealerRevealed == true then
        print("\nDealer cards: " .. totalDealerCards)
        print("Your cards: " .. totalUserCards)
        print("You lose! Dealer got lucky!")
        menu = false
        done = true
    elseif totalDealerCards > 16 then
        if standchoice == true then
            if totalDealerCards == totalUserCards then
                print("\nYour cards: " .. totalUserCards)
                print("Dealer cards: " .. totalDealerCards)
                print("Draw!")
                menu = false
                done = true
            elseif totalDealerCards > totalUserCards and totalDealerCards <= 21 then
                print("\nYour cards: " .. totalUserCards)
                print("Dealer cards: " .. totalDealerCards)
                print("You lose.")
                menu = false
                done = true
            elseif totalDealerCards < totalUserCards and totalUserCards <= 21 then
                print("\nYour cards: " .. totalUserCards)
                print("Dealer cards: " .. totalDealerCards)
                print("You win!")
                menu = false
                done = true
            end
        elseif totalDealerCards < totalUserCards or totalDealerCards == totalUserCards then
            if totalDealerCards == totalUserCards then
                print("\nYour cards: " .. totalUserCards)
                print("Dealer cards: " .. totalDealerCards)
                print("Draw!")
                menu = false
                done = true
            elseif totalDealerCards > totalUserCards and totalDealerCards <= 21 then
                print("\nYour cards: " .. totalUserCards)
                print("Dealer cards: " .. totalDealerCards)
                print("You lose.")
                menu = false
                done = true
            elseif totalDealerCards < totalUserCards and totalUserCards <= 21 then
                print("\nYour cards: " .. totalUserCards)
                print("Dealer cards: " .. totalDealerCards)
                print("You win!")
                menu = false
                done = true
            end
        end
    end
end

Rules()
if not done then
    print("Dealer first card: " .. dealerCards[1])
end

while menu do
    Rules()
    print("Your current cards: " .. totalUserCards)
    io.write("Hit or stand?: ")
    local choice = io.read():lower()
    if choice == "hit" or choice == "h" then
        table.insert(userCards, DrawCard())
        totalUserCards = CalculateTotal(userCards)
        Rules()
        if not done then
            print("Dealer cards: " .. totalDealerCards)
        end
    elseif choice == "stand" or choice == "s" then
        standchoice = true
        dealerRevealed = true
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
        print("Dealer cards: " .. totalDealerCards)
    end
end