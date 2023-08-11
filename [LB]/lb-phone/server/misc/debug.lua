CreateThread(function()
    if not Config.Debug then
        return
    end

    RegisterCommand("testmail", function() 
        exports["lb-phone"]:SendMail({
            to = "test@lbphone.com",
            sender = "Test",
            subject = "Test",
            message = "Hello this is a test"
        })
    end, false)

    RegisterCommand("testcall", function(src, args)
        local number = args[1]
        if not number then
            return
        end

        exports["lb-phone"]:CreateCall({
            phoneNumber = "123",
            source = src
        }, number, {
            requirePhone = false,
            hideNumber = true
        })
    end, false)


    RegisterCommand("addcontactserver", function(source, args)
        local number = exports["lb-phone"]:GetEquippedPhoneNumber(source)

        print("Number: ", number)

        exports["lb-phone"]:AddContact(number, {
            firstname = "David",
            lastname =  "Doe",
            number = args[1] or "1234567890",
            avatar = "https://i.imgur.com/2X1uYkU.png"
        })
    end, false)

    RegisterCommand("amberalertserver", function(source)
        local number = exports["lb-phone"]:GetEquippedPhoneNumber(source)

        if not number then return print("No number") end

        exports["lb-phone"]:SendAmberAlert(source, {
            title = "Amber Alert",
            content = "This is a test amber alert.",
            icon = "warning"
        })

        
    end)


    RegisterCommand("endcall", function(source)
        exports["lb-phone"]:EndCall(source)
    end, false)

end)