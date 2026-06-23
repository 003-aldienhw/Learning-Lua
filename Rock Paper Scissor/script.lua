math.randomseed(os.time())

local opponentChoice = math.random(1, 3)

print("\n==Rock Paper Scissor==")
print("1. Rock")
print("2. Paper")
print("3. Scissor")
io.write("Choose: ")
local userChoice = io.read("*n")

if userChoice == 1 then
    if opponentChoice == 1 then
        print("Opponent Choose Rock.")
        print("It's Draw!")
    elseif opponentChoice == 2 then
        print("Opponent Choose Paper.")
        print("You Lose :(")
    else
        print("Opponent Choose Scissor.")
        print("You win :)")
    end
elseif userChoice == 2 then
    if opponentChoice == 1 then
        print("Opponent Choose Rock.")
        print("You win :)")
    elseif opponentChoice == 2 then
        print("Opponent Choose Paper.")
        print("It's Draw!")
    else
        print("Opponent Choose Scissor.")
        print("You Lose :(")
    end
elseif userChoice == 3 then
    if opponentChoice == 1 then
        print("Opponent Choose Rock.")
        print("You Lose:(")
    elseif opponentChoice == 2 then
        print("Opponent Choose Paper.")
        print("You Win :)")
    else
        print("Opponent Choose Scissor.")
        print("It's Draw!")
    end
else
    print("Invalid Choice!")
end