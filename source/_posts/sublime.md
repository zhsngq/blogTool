---
title: sublime Code 配置和快捷键
date: 2017-02-27
categories:
    - 工具
    - sublime
tag:
    - 工具
---
<!--more-->

>sublime 配置文件

```json
{
	"auto_find_in_selection": true,
	"bold_folder_labels": true,
	"color_scheme": "Packages/User/SublimeLinter/base16-eighties.dark (SL).tmTheme",
	"dpi_scale": 1.0,
	"draw_minimap_border": true,
	"ensure_newline_at_eof_on_save": true,
	"fade_fold_buttons": false,
	"font_face": "Source Code Pro Light",
	"font_size": 10,
	"gutter": true,
	"highlight_line": true,
	"highlight_modified_tabs": true,
	"caret_style": "phase",
	"ignored_packages":
	[
	],
	"indent_guide_options":
	[
		"draw_normal",
		"draw_active"
	],
	"overlay_scroll_bars": "enabled",
	"rulers":
	[
		80
	],
	"save_on_focus_lost": true,
	"scroll_past_end": true,
	"show_definitions": false,
	"show_encoding": true,
	"show_full_path": false,
	"show_panel_on_build": false,
	"spacegray_sidebar_font_xlarge": true,
	"spacegray_sidebar_tree_large": true,
	"spacegray_tabs_auto_width": true,
	"tab_size": 4,
	"theme": "Spacegray Eighties.sublime-theme",
	"translate_tabs_to_spaces": true,
	"trim_automatic_white_space": true,
	"trim_trailing_white_space_on_save": true,
	"update_check": false,
	"vintage_ctrl_keys": true,
	"vintage_start_in_command_mode": true,
	"word_wrap": "false"
}
```

>sublime keys

 ```json
[
    { "keys": ["ctrl+i"], "command": "next_view_in_stack" },
    { "keys": ["ctrl+o"], "command": "prev_view_in_stack" },
    { "keys": ["alt+/"], "command": "goto_python_definition", "press_command": "drag_select"},
]
```

>sublime php bulid

```json
{
    "cmd": ["php", "$file"], "file_regex": "php$", "selector": "source.php"
}
```

>docBlockr

```json
{
    "jsdocs_extra_tags" : ["@zhsngq {{datetime}}"]
}
```
