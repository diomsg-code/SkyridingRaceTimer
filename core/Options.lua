local addonName, SRT = ...

local L = SRT.localization

function SRT:LoadOptions()
    if (not SRT_Database_Options) then
        SRT_Database_Options = {}
    end

    self.options = SRT_Database_Options

    local variableTable = SRT_Database_Options
    local category, layout = Settings.RegisterVerticalLayoutCategory("Skyriding Race Timer")

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["display"]))

    do
        local name = L["display.name"]
        local tooltip = L["display.tooltip"]
        local variable = "display"
        local defaultValue = true

        local setting = Settings.RegisterAddOnSetting(category, variable, variable, variableTable, Settings.VarType.Boolean, name, defaultValue)
        Settings.CreateCheckbox(category, setting, tooltip)
    end

    do
        local name = L["display-mode.name"]
        local tooltip = L["display-mode.tooltip"]
        local variable = "display-mode"
        local defaultValue = 0

        local function GetOptions()
            local container = Settings.CreateControlTextContainer()
            container:Add(0, L["display-mode.value.0"])
            container:Add(1, L["display-mode.value.1"])
            container:Add(2, L["display-mode.value.2"])
            return container:GetData()
        end

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Number, name, defaultValue)
        Settings.CreateDropdown(category, setting, GetOptions, tooltip)
    end

    do
        local name = L["display-background.name"]
        local tooltip = L["display-background.tooltip"]
        local variable = "display-background"
        local defaultValue = true

        local setting = Settings.RegisterAddOnSetting(category, variable, variable, variableTable, Settings.VarType.Boolean, name, defaultValue)
        Settings.CreateCheckbox(category, setting, tooltip)
    end

    do
        local name = L["display-horizontal-shift.name"]
        local tooltip = L["display-horizontal-shift.tooltip"]
        local variable = "display-horizontal-shift"
        local defaultValue = 0

        local minValue = -500
        local maxValue = 500
        local step = 10

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Number, name, defaultValue)
        local options = Settings.CreateSliderOptions(minValue, maxValue, step)

        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
        Settings.CreateSlider(category, setting, options, tooltip)
    end

    do
        local name = L["display-vertical-shift.name"]
        local tooltip = L["display-vertical-shift.tooltip"]
        local variable = "display-vertical-shift"
        local defaultValue = 200

        local minValue = -400
        local maxValue = 400
        local step = 10

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Number, name, defaultValue)
        local options = Settings.CreateSliderOptions(minValue, maxValue, step)

        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
        Settings.CreateSlider(category, setting, options, tooltip)
    end

    do
        local name = L["display-fadeout-delay.name"]
        local tooltip = L["display-fadeout-delay.tooltip"]
        local variable = "display-fadeout-delay"
        local defaultValue = 3

        local minValue = 1
        local maxValue = 10
        local step = 1

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Number, name, defaultValue)
        local options = Settings.CreateSliderOptions(minValue, maxValue, step)

        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
        Settings.CreateSlider(category, setting, options, tooltip)
    end

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["overview"]))

    do
        local name = L["overview.name"]
        local tooltip = L["overview.tooltip"]
        local variable = "overview"
        local defaultValue = true

        local setting = Settings.RegisterAddOnSetting(category, variable, variable, variableTable, Settings.VarType.Boolean, name, defaultValue)
        Settings.CreateCheckbox(category, setting, tooltip)
    end

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["other-options"]))

    do
        local name = L["debug.name"]
        local tooltip = L["debug.tooltip"]
        local variable = "debug"
        local defaultValue = false

        local setting = Settings.RegisterAddOnSetting(category, variable, variable, variableTable, Settings.VarType.Boolean, name, defaultValue)
        Settings.CreateCheckbox(category, setting, tooltip)
    end

    Settings.RegisterAddOnCategory(category)
end