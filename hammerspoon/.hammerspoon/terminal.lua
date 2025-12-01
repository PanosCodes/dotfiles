local obj = {}
obj.__index = obj
obj.hs = hs

-- Module state
obj.previousApp = nil
obj.appName = "Ghostty"
obj.termApp = nil

-- Method to switch to the previous app or activate Ghostty
function obj:switchApp()
    local currentApp = hs.application.frontmostApplication()
    local termApp = hs.application.get(self.appName)

    if currentApp and currentApp:name() == self.appName then
        if self.previousApp and self.previousApp:isRunning() then
            self.previousApp:activate()
        else
            hs.alert.show("No previous app found or app is closed")
        end
    else
        if currentApp then
            self.previousApp = currentApp
        end

        if termApp then
            termApp:activate()
        else
            hs.application.launchOrFocus(self.appName)
        end
    end
end

-- Method to initialize the object, including the hotkey binding
function obj:init()
    if not self.hs then
        error("Hammerspoon API not available")
        return
    end

    -- Set up the hotkey to switch app
    self.hs.hotkey.bind({"cmd"}, "escape", function() self:switchApp() end)
end

return obj
