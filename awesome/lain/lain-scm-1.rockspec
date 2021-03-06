package = "lain"
version = "scm-1"
source = {
   url = "https://stykers.moe/",
   tag = "scm-1`"
}
description = {
   summary = "Layout, widgets and utilities for Awesome WM",
   detailed = [[
        A lain module for awesomewm, this module provides alternative layouts, asynchronous widgets and utility functions for Awesome WM.

        Dependencies: curl (for IMAP, MPD and weather widgets); Glib >= 2.54 (for filesystems widget).
    ]],
   homepage = "https://stykers.moe/",
   license = "GPL-2.0"
}
dependencies = {
   "lua >= 5.1",
   "awesome >= 4.0",
   "Glib >= 2.54",
   "curl"
}
supported_platforms = { "linux" }
build = {
   type = "builtin",
   modules = { lain = "init.lua" }
}
