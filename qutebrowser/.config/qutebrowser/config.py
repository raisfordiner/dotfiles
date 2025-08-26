# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
# pylint settings included to disable linting errors

from pywal import colors

def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip("#")
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def is_dark_color(hex_color):
    r, g, b = hex_to_rgb(hex_color)
    # Perceived luminance formula
    luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b
    return luminance < 128  # Midpoint between 0 (black) and 255 (white)

# c.colors.statusbar.normal.bg = "#00000000"
# c.colors.statusbar.command.bg = "#00000000"
c.colors.statusbar.normal.fg = colors["primary"]
c.colors.statusbar.normal.bg = colors["bg"]
c.colors.statusbar.insert.fg = colors["bg"]
c.colors.statusbar.insert.bg = colors["primary"]
c.colors.statusbar.command.bg = colors["bg"]
c.colors.statusbar.command.fg = colors["fg"]
c.colors.statusbar.passthrough.fg = colors["primary"]
c.colors.statusbar.caret.fg = colors["bg"]
c.colors.statusbar.caret.bg = colors["primary"]
c.colors.statusbar.caret.selection.fg = colors["bg"]
c.colors.statusbar.caret.selection.bg = colors["primary"]
c.colors.statusbar.passthrough.fg = colors["bg"]
c.colors.statusbar.passthrough.bg = colors["primary"]
c.colors.statusbar.url.fg = colors["fg"]
c.colors.statusbar.url.success.https.fg = colors["fg"]
c.colors.statusbar.url.hover.fg = colors["fg"]
# c.statusbar.show = "always"
c.colors.tabs.even.bg = colors["bg"] # transparent tabs!!
c.colors.tabs.odd.bg = colors["bg"]
c.colors.tabs.bar.bg = colors["bg"]
# c.colors.tabs.even.bg = colors["bg"]
# c.colors.tabs.odd.bg = colors["bg"]
c.colors.tabs.even.fg = colors["fg"]
c.colors.tabs.odd.fg = colors["fg"]
c.colors.tabs.selected.even.bg = colors["bg_alt"]
c.colors.tabs.selected.odd.bg = colors["bg_alt"]
c.colors.tabs.selected.even.fg = colors["primary"]
c.colors.tabs.selected.odd.fg = colors["primary"]
c.colors.hints.bg = colors["bg"]
c.colors.hints.fg = colors["fg"]

c.colors.completion.item.selected.match.fg = colors["secondary"]
c.colors.completion.match.fg = colors["secondary"]

c.colors.tabs.indicator.start = colors["secondary"]
c.colors.tabs.indicator.stop = colors["secondary"]
c.colors.completion.odd.bg = colors["bg"]
c.colors.completion.even.bg = colors["bg"]
c.colors.completion.fg = colors["fg"]
c.colors.completion.category.bg = colors["bg"]
c.colors.completion.category.fg = colors["fg"]
c.colors.completion.item.selected.bg = colors["bg"]
c.colors.completion.item.selected.fg = colors["fg"]

c.colors.messages.info.bg = colors["bg"]
c.colors.messages.info.fg = colors["fg"]
c.colors.messages.error.bg = colors["bg"]
c.colors.messages.error.fg = colors["fg"]
c.colors.downloads.error.bg = colors["bg"]
c.colors.downloads.error.fg = colors["fg"]

c.colors.downloads.bar.bg = colors["bg"]
c.colors.downloads.start.bg = colors["secondary"]
c.colors.downloads.start.fg = colors["fg"]
c.colors.downloads.stop.bg = colors["secondary"]
c.colors.downloads.stop.fg = colors["fg"]

c.colors.tooltip.bg = colors["bg"]
c.colors.webpage.bg = colors["bg"]
c.hints.border = colors["fg"]

# c.url.start_pages = ""
# c.url.default_page = ""

c.tabs.title.format = "{audio}{current_title}"
c.fonts.web.size.default = 20

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
        }

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

config.load_autoconfig() # load settings done via the gui

c.auto_save.session = True # save tabs on quit/restart

# keybinding changes
config.bind('=', 'cmd-set-text -s :open')
config.bind('h', 'history')
config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('sH', 'config-cycle statusbar.show always never')
config.bind('T', 'hint links tab')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')
config.bind('qm', 'macro-record')
config.bind('gJ', 'tab-move +')
config.bind('gK', 'tab-move -')
config.bind('gm', 'tab-move')

# dark mode setup
c.colors.webpage.darkmode.enabled = is_dark_color(colors["bg"])
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# styles, cosmetics
# c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube-tweaks.css"]
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0 # no tab indicators
# c.window.transparent = True # apparently not needed
c.tabs.width = '15%'
c.tabs.show = 'switching'

# fonts
c.fonts.default_family = []
c.fonts.default_size = '13pt'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'

# privacy - adjust these settings based on your preference
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle

# Adblocking info -->
# For yt ads: place the greasemonkey script yt-ads.js in your greasemonkey folder (~/.config/qutebrowser/greasemonkey).
# The script skips through the entire ad, so all you have to do is click the skip button.
# Yeah it's not ublock origin, but if you want a minimal browser, this is a solution for the tradeoff.
# You can also watch yt vids directly in mpv, see qutebrowser FAQ for how to do that.
# If you want additional blocklists, you can get the python-adblock package, or you can uncomment the ublock lists here.
c.content.blocking.enabled = True
# c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
# c.content.blocking.adblock.lists = [
#         "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"]
