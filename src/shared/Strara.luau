--!strict
--@author: netslashh
local CollectionService = game:GetService("CollectionService");
local RunService = game:GetService("RunService");

local Strara = {};

local TAG = "loadModule";

-- Grabs all current modules in a folder.
local function getAllModules(folder: Folder)
    local grabbedModules: {ModuleScript} = {};

    for _, modules in folder:GetChildren() do
        if modules:IsA("ModuleScript") then
            table.insert(grabbedModules, modules);
        end
    end

    for _, modules in folder:GetDescendants() do
        if modules:IsA("ModuleScript") then
            table.insert(grabbedModules, modules);
        end
    end

    if RunService:IsServer() then
        warn(`> [S] Grabbed all modules in {folder}`);
    else
        warn(`> [C] Grabbed all modules in {folder}`);
    end

    return grabbedModules;
end;

-- Grabs all modules that has been tagged with loadModule.
local function getAllTaggedModules()
    local grabAllTaggedModules = {}

    for _, modules in CollectionService:GetTagged(TAG) do
        if modules:IsA("ModuleScript") then
            table.insert(grabAllTaggedModules, modules);
        end
    end

    return grabAllTaggedModules
end;

-- Requries all modules.
local function requireModules(folder: Folder)
    local grabbedModules = getAllModules(folder);
    local grabbedTaggedModules = getAllTaggedModules();
    local currentModules: {ModuleScript} = {};

    for _, modules in grabbedModules do
        if modules:IsA("ModuleScript") then
            table.insert(currentModules, modules)
        end
    end

    for _, modules in grabbedTaggedModules do
        if modules:IsA("ModuleScript") then
            table.insert(currentModules, modules)
        end
    end

    for _, modules in currentModules do
        if RunService:IsServer() then
            warn(`> [S] requring {modules.Name}`);
            require(modules);
        else
            warn(`> [C] requring {modules.Name}`);
            require(modules);
        end
    end

    return currentModules
end

-- Loads Strara.
function Strara:load(path: Folder)
    warn(`=== STRARA HAS BEEN LOADED ===`);
    requireModules(path)
end

return Strara;