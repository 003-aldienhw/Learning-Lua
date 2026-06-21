local aura = 0
local menu = true
local weaponselected = false
local armorselected = false

while menu do
    print("\n-- MENU --")
    print("1. Choose your weapon")
    print("2. Choose your armor")
    print("3. Exit")
    io.write("Choose: ")
    local choice = io.read("*n")

    if choice == 1 then
        if weaponselected then
            print("You already select a weapon!")
        else
        print("\n -- WEAPONS --")
        print("1. AK-47")
        print("2. M4")
        print("3. Bizon")
        io.write("Choose: ")
        local weaponchoice = io.read("*n")
        if weaponchoice == 1 then
            print("Goat choice!")
            aura = aura + 20
            weaponselected = true
        elseif weaponchoice == 2 then
            print("Good choice!")
            aura = aura + 10
            weaponselected = true
        elseif weaponchoice== 3 then
            print("Meh..")
            aura = aura + 1
            weaponselected = true
        end
        end
    elseif choice == 2 then
        if armorselected then
            print("You already select an armor!")
        else
        print("\n-- ARMORS --")
        print("1. Netherite armor")
        print("2. Diamond armor")
        print("3. Iron armor")
        io.write("Choose: ")
        local armorchoice = io.read("n")
        if armorchoice == 1 then
            print("Goat choice")
            aura = aura + 20
            armorselected = true
        elseif armorchoice == 2 then
            print("Good choice")
            aura = aura + 10
            armorselected = true
        elseif armorchoice == 3 then
            print("Sure...")
            aura = aura + 5
            armorselected = true
        end
        end
    elseif choice == 3 then
        print("Here's your total aura: " .. aura)
        print("Bye")
        menu = false
    else
        print("Choice the right one!")
    end
end
