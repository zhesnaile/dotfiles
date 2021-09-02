local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local tasklist = {}

local tasklist_padding = 22

local tasklist_buttons = gears.table.join(
                       awful.button({ }, 1, function (c)
                                                if c == client.focus then
                                                    c.minimized = true
                                                else
                                                    c:emit_signal(
                                                        "request::activate",
                                                        "tasklist",
                                                        {raise = true}
                                                    )
                                                end
                                            end),
                       awful.button({ }, 3, function()
                                                awful.menu.client_list({ theme = { width = 250 } })
                                            end),
                       awful.button({ }, 4, function ()
                                                awful.client.focus.byidx(1)
                                            end),
                       awful.button({ }, 5, function ()
                                                awful.client.focus.byidx(-1)
                                            end))
function tasklist.get(s)
    local widget = awful.widget.tasklist{
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        widget_template = {
            {
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox
                },
                left = dpi(taglist_padding),
                right = dpi(taglist_padding),
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        },
        buttons = tasklist_buttons
    }

    return widget
end

return tasklist
