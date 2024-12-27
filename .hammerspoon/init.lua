local previousApp = nil

hs.hotkey.bind({"cmd"}, "`", function()
    local appName = "Ghostty"
    local termApp = hs.application.get(appName)
    local currentApp = hs.application.frontmostApplication()

    if currentApp and currentApp:name() == appName then
        if previousApp and previousApp:isRunning() then
            previousApp:activate()
        else
            hs.alert.show("No previous app found or app is closed")
        end
    else
        if currentApp then
            previousApp = currentApp
        end

        if termApp then
            termApp:activate()
        else
            hs.application.launchOrFocus(appName)
        end
    end
end)
