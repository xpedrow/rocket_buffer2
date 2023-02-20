local apiURL = getAPIURL()

function getAPIData()
    fetchRemote(apiURL, function(receivedData, receivedError)
        if receivedData == 'ERROR' or error ~= 0 then
            return error('Something is wrong in the API')
        end

        local receivedData = fromJSON(receivedData)

        outputChatBox('Usuários cadastrados na rocket atualmente: ' .. data.static.user, 80, 11, 230)
    end)
end