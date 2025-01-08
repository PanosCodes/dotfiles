local obj = {}
obj.__index = obj
obj.hs = hs

-- Module state
obj.workspaceNames = {
    [1] = "1. Running",
    [2] = "2. Code",
    [3] = "3. Browse",
    [4] = "4. Work",
}
obj.menuBarItem = nil

-- Method to update the menu bar with the current workspace name based on index
function obj:updateWorkspaceName()
    local allSpaces = self.hs.spaces.allSpaces()  -- Get all spaces
    local focusedSpace = self.hs.spaces.focusedSpace()  -- Get the focused space ID
    local spaceIndex = 1
    local index = 1  -- Start from 1 or another index if needed

    for key, space in pairs(allSpaces) do
        if space[1] == focusedSpace then
            spaceIndex = index
            break
        end
        index = index + 1  -- Increment the index
    end

    -- Set workspace name from the mapping
    local name = self.workspaceNames[spaceIndex] or ("Space " .. spaceIndex)
    self.menuBarItem:setTitle(name)
end

-- Method to initialize the object, including the menu bar and watcher
function obj:init()
    if not self.hs then
        error("Hammerspoon API not available")
        return
    end

    -- Create a menubar item
    self.menuBarItem = self.hs.menubar.new()

    -- Monitor for space changes and update the menu bar
    self.hs.spaces.watcher.new(function() self:updateWorkspaceName() end):start()

    -- Initialize with the current space name
    self:updateWorkspaceName()
end

return obj
