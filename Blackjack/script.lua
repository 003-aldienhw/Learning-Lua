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
local dealerRevealed = false
local standchoice = false

function DrawCard()
    local card = math.random(1, #deck)
    return table.remove(deck, card)
end

function CalculateTotal(cards)
    local total = 0
    local aces = 0

    for _, value in ipairs(cards) do
        total = total + value

        if value == 11 then
            aces = aces + 1
        end
    end

    while total > 21 and aces > 0 do
        total = total - 10
        aces = aces - 1
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
    if totalUserCards > 21 then
        print("\nYour cards: " .. totalUserCards)
        print("You lose. Your cards exceed 21.")
        menu = false
    elseif totalDealerCards > 21 and dealerRevealed == true then
        print("\nDealer cards: " .. totalDealerCards)
        print("You win! Dealer busts!")
        menu = false
    elseif totalUserCards == 21 then
        print("\nYour cards: " .. totalUserCards)
        print("You win! You very lucky!")
        menu = false
    elseif totalDealerCards == 21 and dealerRevealed == true then
        print("\nDealer cards: " .. totalDealerCards)
        print("Your cards: " .. totalUserCards)
        print("You lose! Dealer got lucky!")
        menu = false
    elseif totalDealerCards >= 17 and dealerRevealed == true and standchoice == true then
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
if menu then
    print("Dealer first card: " .. dealerCards[1])
end

while menu do
    print("Your current cards: " .. totalUserCards)
    io.write("Hit or stand?: ")
    local choice = io.read():lower()
    if choice == "hit" then
        table.insert(userCards, DrawCard())
        totalUserCards = CalculateTotal(userCards)
        Rules()
        if menu then
            print("\nDealer first card: " .. dealerCards[1])
        end
    elseif choice == "stand" then
        standchoice = true
        dealerRevealed = true
        while totalDealerCards <= 16 do
            table.insert(dealerCards, DrawCard())
            totalDealerCards = CalculateTotal(dealerCards)
        end
        Rules()
    elseif choice == "exit" then
        print("\nThanks for playing!")
        menu = false
    else
        print("\nChoose the right one!")
        print("Dealer first card: " .. dealerCards[1])
    end
end