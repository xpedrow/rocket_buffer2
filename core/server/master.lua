local apiURL = getAPIURL()

function getAPIData(player)
    fetchRemote(apiURL, function(receivedData, receivedError)
        if not receivedData or receivedData == 'ERROR' or receivedError ~= 0 then
            return error('Something is wrong in the API')
        end

        local receivedData = fromJSON(receivedData)

        outputChatBox('Usuários cadastrados na rocket atualmente: ' .. receivedData.static.users, player, 80, 11, 230)
    end)
end