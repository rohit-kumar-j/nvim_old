local default_banner = {
	"  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
	"  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
	"  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
	"  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
	"  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
}
local bison_head = {
	"          .                                                      .",
	"        .n                   .                 .                  n.",
	"  .   .dP                  dP                   9b                 9b.    .",
	" 4    qXb         .       dX                     Xb       .        dXp     t",
	"dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb",
	"9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP",
	" 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP",
	"  `9XXXXXXXXXXXXXXXXXXXXX'~   ~`OOO8b   d8OOO'~   ~`XXXXXXXXXXXXXXXXXXXXXP'",
	"    `9XXXXXXXXXXXP' `9XX'   DIE    `98v8P'  HUMAN   `XXP' `9XXXXXXXXXXXP'",
	"        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~",
	"                        )b.  .dbo.dP'`v'`9b.odb.  .dX(",
	"                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.",
	"                     dXXXXXXXXXXXP'   .   `9XXXXXXXXXXXb",
	"                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb",
	"                    9XXb'   `XXXXXb.dX|Xb.dXXXXX'   `dXXP",
	"                     `'      9XXXXXX(   )XXXXXXP      `'",
	"                              XXXX X.`v'.X XXXX",
	"                              XP^X'`b   d'`X^XX",
	"                              X. 9  `   '  P )X",
	"                              `b  `       '  d'",
	"                               `             '"
}
local custom_banner = {
	"",
	"",
	" ⣿⣿⣷⡁⢆⠈⠕⢕⢂⢕⢂⢕⢂⢔⢂⢕⢄⠂⣂⠂⠆⢂⢕⢂⢕⢂⢕⢂⢕⢂ ",
	" ⣿⣿⣿⡷⠊⡢⡹⣦⡑⢂⢕⢂⢕⢂⢕⢂⠕⠔⠌⠝⠛⠶⠶⢶⣦⣄⢂⢕⢂⢕ ",
	" ⣿⣿⠏⣠⣾⣦⡐⢌⢿⣷⣦⣅⡑⠕⠡⠐⢿⠿⣛⠟⠛⠛⠛⠛⠡⢷⡈⢂⢕⢂ ",
	" ⠟⣡⣾⣿⣿⣿⣿⣦⣑⠝⢿⣿⣿⣿⣿⣿⡵⢁⣤⣶⣶⣿⢿⢿⢿⡟⢻⣤⢑⢂ ",
	" ⣾⣿⣿⡿⢟⣛⣻⣿⣿⣿⣦⣬⣙⣻⣿⣿⣷⣿⣿⢟⢝⢕⢕⢕⢕⢽⣿⣿⣷⣔ ",
	" ⣿⣿⠵⠚⠉⢀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⢕⢕⢕⢕⢕⢕⣽⣿⣿⣿⣿ ",
	" ⢷⣂⣠⣴⣾⡿⡿⡻⡻⣿⣿⣴⣿⣿⣿⣿⣿⣿⣷⣵⣵⣵⣷⣿⣿⣿⣿⣿⣿⡿ ",
	" ⢌⠻⣿⡿⡫⡪⡪⡪⡪⣺⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃ ",
	" ⠣⡁⠹⡪⡪⡪⡪⣪⣾⣿⣿⣿⣿⠋⠐⢉⢍⢄⢌⠻⣿⣿⣿⣿⣿⣿⣿⣿⠏⠈ ",
	" ⡣⡘⢄⠙⣾⣾⣾⣿⣿⣿⣿⣿⣿⡀⢐⢕⢕⢕⢕⢕⡘⣿⣿⣿⣿⣿⣿⠏⠠⠈ ",
	" ⠌⢊⢂⢣⠹⣿⣿⣿⣿⣿⣿⣿⣿⣧⢐⢕⢕⢕⢕⢕⢅⣿⣿⣿⣿⡿⢋⢜⠠⠈ ",
	" ⠄⠁⠕⢝⡢⠈⠻⣿⣿⣿⣿⣿⣿⣿⣷⣕⣑⣑⣑⣵⣿⣿⣿⡿⢋⢔⢕⣿⠠⠈ ",
	" ⠨⡂⡀⢑⢕⡅⠂⠄⠉⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⢔⢕⢕⣿⣿⠠⠈ ",
	" ⠄⠪⣂⠁⢕⠆⠄⠂⠄⠁⡀⠂⡀⠄⢈⠉⢍⢛⢛⢛⢋⢔⢕⢕⢕⣽⣿⣿⠠⠈ ",
	"",
	"",
}
local neo_land = {
	'',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣤⣄⣀⣆⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⡿⢛⣻⣿⠳⣽⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣼⣿⣿N⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⣰⣿⣿⣿⡿⣻⢟⣼⣿⣿⠟⣩E⣿⣿⣿⣿⣮⣿⣆⡀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⣰⣿⣿⢋⡿⠑⠋⣾⣿⣿⣇⠳⢿O⣿⠹⠿⢿⣿⣻⣿⡿⠋⠀⠀⠀',
	'⠀⠀⠀⣰⣟⡽⠷⠋⠀⠀⠀⠇⣿⣿⣿⣿LAND⣶⡄⠾⠛⠙⣷⣄⡀⠀⠀',
	'⠀⢀⡾⠛⠉⠀⠀⠀⠀⠀⠀⠀⠻⡹⣿⡿⢿⣿⣿⣿⣿⣿⣿⣶⣆⡘⠷⣉⠆⠀',
	'⠐⠉⠀⠀⠀⠀⠀⠀⢀⣴⣶⣶⣶⣧⣝⣷⣄⠈⠙⢿⡏⢻⢻⢻⣿⣷⡀⠈⠑⠄',
	'⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⠋⠀⠀⠉⠛⢿⣷⣄⡀⠀⠹⠀⠀⣼⣿⡟⡇⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣧⡀⠀⠀⢀⡠⣬⣿⣿⣿⣶⣿⣿⣿⣿⠇⠃⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⢷⣶⣦⣬⣿⣦⣌⠭⠿⠟⠋⢀⠏⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠛⠛⠿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠶⠄⠀⠀⠀⠀⠀',
	'',
}

vim.g.dashboard_default_executive = 'telescope'

local home = os.getenv('HOME')
local db = require('dashboard')

db.setup({
	theme = 'hyper',
	config = {
		header = default_banner,
		-- week_header = {
		--      enable = true,
		-- },
		shortcut = {
			{
				desc = ' MasonInstall',
				group = '@property',
				action = 'PackerSync',
				key = 'u'
			},
			{
				icon = ' ',
				icon_hl = '@variable',
				desc = 'Mason',
				group = 'Label',
				action = 'Mason',
				key = 'm',
			},
			{
				desc = ' Terminal',
				group = 'DiagnosticHint',
				action = 'ToggleTerm',
				key = 't',
			},
			{
				desc = ' PackerStatus',
				group = 'Number',
				action = 'PackerStatus',
				key = 's',
			},
		},
	},
})
