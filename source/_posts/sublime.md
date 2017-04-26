---
title: sublime Code 配置和快捷键
date: 2017-02-27
categories:
    - 工具
    - sublime
tag:
    - 工具
---
sublime 配置文件 sublime keys
<!--more-->

>sublime 配置文件

```json
{
    "auto_find_in_selection": true,
    "bold_folder_labels": true,
    "caret_style": "phase",
    "color_scheme": "Packages/User/SublimeLinter/LastNight (SL).tmTheme",
    "dpi_scale": 1.0,
    "draw_minimap_border": true,
    "enable_tab_scrolling": false,
    "ensure_newline_at_eof_on_save": true,
    "fade_fold_buttons": false,
    "font_face": "Fira Code Retina",
    "font_options":
    [
        "directwrite"
    ],
    "font_size": 11,
    "gutter": true,
    "highlight_line": true,
    "highlight_modified_tabs": true,
    "ignored_packages":
    [
    ],
    "indent_guide_options":
    [
        "draw_normal",
        "draw_active"
    ],
    "itg_sidebar_tree_xlarge": true,
    "itg_small_tabs": true,
    "material_theme_accent_red": true,
    "material_theme_arrow_folders": true,
    "material_theme_bold_tab": true,
    "material_theme_compact_sidebar": true,
    "material_theme_contrast_mode": true,
    "material_theme_disable_folder_animation": true,
    "material_theme_panel_separator": true,
    "material_theme_small_statusbar": true,
    "material_theme_small_tab": true,
    "material_theme_tabs_autowidth": true,
    "material_theme_tabs_separator": true,
    "material_theme_tree_headings": true,
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
    "tab_size": 4,
    "theme": "Material-Theme-Palenight.sublime-theme",
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
    { "keys": ["alt+shift+f"], "command": "reindent" },
    { "keys": ["ctrl+w"], "command": "close_file" },
    { "keys": ["f5"], "command": "build","args": { "panel": "output.exec" } },
    {
      "keys": ["f6"],
      "command": "show_panel",
      "args": { "panel": "output.exec" }
    }
]
```

>docBlockr

```json
{
    "jsdocs_extra_tags" : ["@zhsngq {{datetime}}"]
}
```
