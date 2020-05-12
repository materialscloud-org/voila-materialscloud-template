{%- extends 'base.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}

{# this overrides the default behavior of directly starting the kernel and executing the notebook #}
{% block notebook_execute %}
{% endblock notebook_execute %}

{%- block html_head_css -%}
<link rel="stylesheet" href="https://unpkg.com/font-awesome@4.5.0/css/font-awesome.min.css" type="text/css">
<link href="{{resources.base_url}}voila/static/index.css" rel="stylesheet" type='text/css'>
{% if resources.theme == 'dark' %}
{% set bar_color = '#555454' %}
<link href="{{resources.base_url}}voila/static/theme-dark.css" rel="stylesheet" type='text/css'>
{% else %}
{% set bar_color = '#f3f700' %}
<link href="{{resources.base_url}}voila/static/theme-light.css" rel="stylesheet" type='text/css'>
{% endif %}
<link href="{{resources.base_url}}voila/static/materialize.min.css" rel="stylesheet" type='text/css'>
<link href="{{resources.base_url}}voila/static/mcloud_theme.min.css" rel="stylesheet" type='text/css'>

<style md-theme-style="">md-autocomplete.md-default-theme input, md-autocomplete input{color:rgba(0,0,0,0.87)}.md-autocomplete-standard-list-container.md-default-theme .md-autocomplete-suggestion, .md-autocomplete-standard-list-container .md-autocomplete-suggestion,.md-autocomplete-suggestions-container.md-default-theme .md-autocomplete-suggestion, .md-autocomplete-suggestions-container .md-autocomplete-suggestion{color:rgba(0,0,0,0.87)}md-bottom-sheet.md-default-theme.md-list md-list-item, md-bottom-sheet.md-list md-list-item{color:rgba(0,0,0,0.87)}.md-button.md-default-theme.md-primary, .md-button.md-primary{color:rgb(63,81,181)}.md-button.md-default-theme.md-primary.md-fab, .md-button.md-primary.md-fab,.md-button.md-default-theme.md-primary.md-raised, .md-button.md-primary.md-raised{color:rgba(255,255,255,0.87);background-color:rgb(63,81,181)}.md-button.md-default-theme.md-primary.md-fab:not([disabled]) md-icon, .md-button.md-primary.md-fab:not([disabled]) md-icon,.md-button.md-default-theme.md-primary.md-raised:not([disabled]) md-icon, .md-button.md-primary.md-raised:not([disabled]) md-icon{color:rgba(255,255,255,0.87)}.md-button.md-default-theme.md-primary.md-fab:not([disabled]).md-focused, .md-button.md-primary.md-fab:not([disabled]).md-focused,.md-button.md-default-theme.md-primary.md-fab:not([disabled]):hover, .md-button.md-primary.md-fab:not([disabled]):hover,.md-button.md-default-theme.md-primary.md-raised:not([disabled]).md-focused, .md-button.md-primary.md-raised:not([disabled]).md-focused,.md-button.md-default-theme.md-primary.md-raised:not([disabled]):hover, .md-button.md-primary.md-raised:not([disabled]):hover{background-color:rgb(57,73,171)}.md-button.md-default-theme.md-primary:not([disabled]) md-icon, .md-button.md-primary:not([disabled]) md-icon{color:rgb(63,81,181)}._md a.md-default-theme:not(.md-button).md-primary, ._md a:not(.md-button).md-primary{color:rgb(63,81,181)}._md a.md-default-theme:not(.md-button).md-primary:hover, ._md a:not(.md-button).md-primary:hover{color:rgb(48,63,159)}md-card.md-default-theme .md-card-image, md-card .md-card-image{border-radius:2px 2px 0 0}md-card.md-default-theme md-card-header md-card-header-text .md-subhead, md-card md-card-header md-card-header-text .md-subhead,md-card.md-default-theme md-card-title md-card-title-text:not(:only-child) .md-subhead, md-card md-card-title md-card-title-text:not(:only-child) .md-subhead{color:rgba(0,0,0,0.54)}md-checkbox.md-default-theme .md-ink-ripple, md-checkbox .md-ink-ripple{color:rgba(0,0,0,0.54)}md-checkbox.md-default-theme:not(.md-checked) .md-icon, md-checkbox:not(.md-checked) .md-icon{border-color:rgba(0,0,0,0.54)}md-checkbox.md-default-theme:not([disabled]).md-primary .md-ripple, md-checkbox:not([disabled]).md-primary .md-ripple{color:rgb(57,73,171)}md-checkbox.md-default-theme:not([disabled]).md-primary.md-checked .md-ripple, md-checkbox:not([disabled]).md-primary.md-checked .md-ripple{color:rgb(117,117,117)}md-checkbox.md-default-theme:not([disabled]).md-primary .md-ink-ripple, md-checkbox:not([disabled]).md-primary .md-ink-ripple{color:rgba(0,0,0,0.54)}md-checkbox.md-default-theme:not([disabled]).md-primary.md-checked .md-ink-ripple, md-checkbox:not([disabled]).md-primary.md-checked .md-ink-ripple{color:rgba(63,81,181,0.87)}md-checkbox.md-default-theme:not([disabled]).md-primary:not(.md-checked) .md-icon, md-checkbox:not([disabled]).md-primary:not(.md-checked) .md-icon{border-color:rgba(0,0,0,0.54)}md-checkbox.md-default-theme:not([disabled]).md-primary.md-checked .md-icon, md-checkbox:not([disabled]).md-primary.md-checked .md-icon{background-color:rgba(63,81,181,0.87)}md-checkbox.md-default-theme:not([disabled]).md-primary.md-checked.md-focused .md-container:before, md-checkbox:not([disabled]).md-primary.md-checked.md-focused .md-container:before{background-color:rgba(63,81,181,0.26)}md-checkbox.md-default-theme:not([disabled]).md-primary.md-checked .md-icon:after, md-checkbox:not([disabled]).md-primary.md-checked .md-icon:after{border-color:rgba(255,255,255,0.87)}md-checkbox.md-default-theme:not([disabled]).md-primary .md-indeterminate[disabled] .md-container, md-checkbox:not([disabled]).md-primary .md-indeterminate[disabled] .md-container{color:rgba(0,0,0,0.38)}md-checkbox.md-default-theme[disabled]:not(.md-checked) .md-icon, md-checkbox[disabled]:not(.md-checked) .md-icon{border-color:rgba(0,0,0,0.38)}md-checkbox.md-default-theme[disabled] .md-icon:after, md-checkbox[disabled] .md-icon:after{border-color:rgba(0,0,0,0.38)}md-checkbox.md-default-theme[disabled] .md-label, md-checkbox[disabled] .md-label{color:rgba(0,0,0,0.38)}md-chips.md-default-theme .md-chips, md-chips .md-chips{box-shadow:0 1px rgba(0,0,0,0.12)}md-chips.md-default-theme .md-chips.md-focused, md-chips .md-chips.md-focused{box-shadow:0 2px rgb(63,81,181)}md-chips.md-default-theme .md-chips .md-chip-input-container input, md-chips .md-chips .md-chip-input-container input{color:rgba(0,0,0,0.87)}md-chips.md-default-theme .md-chips .md-chip-input-container input::-webkit-input-placeholder, md-chips .md-chips .md-chip-input-container input::-webkit-input-placeholder{color:rgba(0,0,0,0.38)}md-chips.md-default-theme .md-chips .md-chip-input-container input:-ms-input-placeholder, md-chips .md-chips .md-chip-input-container input:-ms-input-placeholder,md-chips.md-default-theme .md-chips .md-chip-input-container input::-ms-input-placeholder, md-chips .md-chips .md-chip-input-container input::-ms-input-placeholder{color:rgba(0,0,0,0.38)}md-chips.md-default-theme .md-chips .md-chip-input-container input::placeholder, md-chips .md-chips .md-chip-input-container input::placeholder{color:rgba(0,0,0,0.38)}md-chips.md-default-theme .md-chips .md-chip-input-container input:-moz-placeholder, md-chips .md-chips .md-chip-input-container input:-moz-placeholder,md-chips.md-default-theme .md-chips .md-chip-input-container input::-moz-placeholder, md-chips .md-chips .md-chip-input-container input::-moz-placeholder{color:rgba(0,0,0,0.38);opacity:1}md-chips.md-default-theme md-chip.md-focused, md-chips md-chip.md-focused{background:rgb(63,81,181);color:rgba(255,255,255,0.87)}md-chips.md-default-theme md-chip.md-focused md-icon, md-chips md-chip.md-focused md-icon{color:rgba(255,255,255,0.87)}.md-default-theme .md-calendar-date.md-calendar-date-today .md-calendar-date-selection-indicator,  .md-calendar-date.md-calendar-date-today .md-calendar-date-selection-indicator{border:1px solid rgb(63,81,181)}.md-default-theme .md-calendar-date.md-calendar-date-today.md-calendar-date-disabled,  .md-calendar-date.md-calendar-date-today.md-calendar-date-disabled{color:rgba(63,81,181,0.6)}.md-default-theme .md-calendar-date.md-calendar-selected-date .md-calendar-date-selection-indicator,  .md-calendar-date.md-calendar-selected-date .md-calendar-date-selection-indicator,.md-default-theme .md-calendar-date.md-focus.md-calendar-selected-date .md-calendar-date-selection-indicator,  .md-calendar-date.md-focus.md-calendar-selected-date .md-calendar-date-selection-indicator{background:rgb(63,81,181);color:rgba(255,255,255,0.87);border-color:transparent}.md-default-theme .md-calendar-date-disabled,  .md-calendar-date-disabled,.md-default-theme .md-calendar-month-label-disabled,  .md-calendar-month-label-disabled{color:rgba(0,0,0,0.38)}.md-default-theme .md-calendar-month-label md-icon,  .md-calendar-month-label md-icon,.md-default-theme .md-datepicker-input,  .md-datepicker-input{color:rgba(0,0,0,0.87)}.md-default-theme .md-datepicker-input::-webkit-input-placeholder,  .md-datepicker-input::-webkit-input-placeholder{color:rgba(0,0,0,0.38)}.md-default-theme .md-datepicker-input:-ms-input-placeholder,  .md-datepicker-input:-ms-input-placeholder,.md-default-theme .md-datepicker-input::-ms-input-placeholder,  .md-datepicker-input::-ms-input-placeholder{color:rgba(0,0,0,0.38)}.md-default-theme .md-datepicker-input::placeholder,  .md-datepicker-input::placeholder{color:rgba(0,0,0,0.38)}.md-default-theme .md-datepicker-input:-moz-placeholder,  .md-datepicker-input:-moz-placeholder,.md-default-theme .md-datepicker-input::-moz-placeholder,  .md-datepicker-input::-moz-placeholder{color:rgba(0,0,0,0.38);opacity:1}.md-default-theme .md-datepicker-input-container,  .md-datepicker-input-container{border-bottom-color:rgba(0,0,0,0.12)}.md-default-theme .md-datepicker-input-container.md-datepicker-focused,  .md-datepicker-input-container.md-datepicker-focused{border-bottom-color:rgb(63,81,181)}.md-default-theme .md-datepicker-triangle-button .md-datepicker-expand-triangle,  .md-datepicker-triangle-button .md-datepicker-expand-triangle{border-top-color:rgba(0,0,0,0.54)}.md-default-theme .md-datepicker-open .md-datepicker-calendar-icon,  .md-datepicker-open .md-datepicker-calendar-icon{color:rgb(63,81,181)}md-dialog.md-default-theme.md-content-overflow .md-actions, md-dialog.md-content-overflow .md-actions,md-dialog.md-default-theme.md-content-overflow md-dialog-actions, md-dialog.md-content-overflow md-dialog-actions,md-divider.md-default-theme, md-divider{border-top-color:rgba(0,0,0,0.12)}.layout-gt-lg-row>md-divider.md-default-theme, .layout-gt-lg-row>md-divider,.layout-gt-md-row>md-divider.md-default-theme, .layout-gt-md-row>md-divider,.layout-gt-sm-row>md-divider.md-default-theme, .layout-gt-sm-row>md-divider,.layout-gt-xs-row>md-divider.md-default-theme, .layout-gt-xs-row>md-divider,.layout-lg-row>md-divider.md-default-theme, .layout-lg-row>md-divider,.layout-md-row>md-divider.md-default-theme, .layout-md-row>md-divider,.layout-row>md-divider.md-default-theme, .layout-row>md-divider,.layout-sm-row>md-divider.md-default-theme, .layout-sm-row>md-divider,.layout-xl-row>md-divider.md-default-theme, .layout-xl-row>md-divider,.layout-xs-row>md-divider.md-default-theme, .layout-xs-row>md-divider{border-right-color:rgba(0,0,0,0.12)}md-icon.md-default-theme, md-icon{color:rgba(0,0,0,0.54)}md-icon.md-default-theme.md-primary, md-icon.md-primary{color:rgb(63,81,181)}md-input-container.md-default-theme .md-input, md-input-container .md-input{color:rgba(0,0,0,0.87);border-color:rgba(0,0,0,0.12)}md-input-container.md-default-theme .md-input::-webkit-input-placeholder, md-input-container .md-input::-webkit-input-placeholder{color:rgba(0,0,0,0.54)}md-input-container.md-default-theme .md-input:-ms-input-placeholder, md-input-container .md-input:-ms-input-placeholder,md-input-container.md-default-theme .md-input::-ms-input-placeholder, md-input-container .md-input::-ms-input-placeholder{color:rgba(0,0,0,0.54)}md-input-container.md-default-theme .md-input::placeholder, md-input-container .md-input::placeholder{color:rgba(0,0,0,0.54)}md-input-container.md-default-theme .md-input:-moz-placeholder, md-input-container .md-input:-moz-placeholder,md-input-container.md-default-theme .md-input::-moz-placeholder, md-input-container .md-input::-moz-placeholder{color:rgba(0,0,0,0.54);opacity:1}md-input-container.md-default-theme>md-icon, md-input-container>md-icon{color:rgba(0,0,0,0.87)}md-input-container.md-default-theme .md-placeholder, md-input-container .md-placeholder,md-input-container.md-default-theme label, md-input-container label{color:rgba(0,0,0,0.54)}md-input-container.md-default-theme:not(.md-input-focused):not(.md-input-invalid) label.md-required:after, md-input-container:not(.md-input-focused):not(.md-input-invalid) label.md-required:after{color:rgba(0,0,0,0.54)}md-input-container.md-default-theme .md-input-message-animation .md-char-counter, md-input-container .md-input-message-animation .md-char-counter,md-input-container.md-default-theme .md-input-messages-animation .md-char-counter, md-input-container .md-input-messages-animation .md-char-counter{color:rgba(0,0,0,0.87)}md-input-container.md-default-theme.md-input-focused .md-input::-webkit-input-placeholder, md-input-container.md-input-focused .md-input::-webkit-input-placeholder{color:rgba(0,0,0,0.54)}md-input-container.md-default-theme.md-input-focused .md-input:-ms-input-placeholder, md-input-container.md-input-focused .md-input:-ms-input-placeholder,md-input-container.md-default-theme.md-input-focused .md-input::-ms-input-placeholder, md-input-container.md-input-focused .md-input::-ms-input-placeholder{color:rgba(0,0,0,0.54)}md-input-container.md-default-theme.md-input-focused .md-input::placeholder, md-input-container.md-input-focused .md-input::placeholder{color:rgba(0,0,0,0.54)}md-input-container.md-default-theme.md-input-focused .md-input:-moz-placeholder, md-input-container.md-input-focused .md-input:-moz-placeholder,md-input-container.md-default-theme.md-input-focused .md-input::-moz-placeholder, md-input-container.md-input-focused .md-input::-moz-placeholder{color:rgba(0,0,0,0.54);opacity:1}md-input-container.md-default-theme:not(.md-input-invalid).md-input-has-value label, md-input-container:not(.md-input-invalid).md-input-has-value label{color:rgba(0,0,0,0.54)}md-input-container.md-default-theme:not(.md-input-invalid).md-input-focused .md-input, md-input-container:not(.md-input-invalid).md-input-focused .md-input,md-input-container.md-default-theme:not(.md-input-invalid).md-input-resized .md-input, md-input-container:not(.md-input-invalid).md-input-resized .md-input{border-color:rgb(63,81,181)}md-input-container.md-default-theme:not(.md-input-invalid).md-input-focused label, md-input-container:not(.md-input-invalid).md-input-focused label,md-input-container.md-default-theme:not(.md-input-invalid).md-input-focused md-icon, md-input-container:not(.md-input-invalid).md-input-focused md-icon{color:rgb(63,81,181)}md-list.md-default-theme md-list-item.md-2-line .md-list-item-text h3, md-list md-list-item.md-2-line .md-list-item-text h3,md-list.md-default-theme md-list-item.md-2-line .md-list-item-text h4, md-list md-list-item.md-2-line .md-list-item-text h4,md-list.md-default-theme md-list-item.md-3-line .md-list-item-text h3, md-list md-list-item.md-3-line .md-list-item-text h3,md-list.md-default-theme md-list-item.md-3-line .md-list-item-text h4, md-list md-list-item.md-3-line .md-list-item-text h4{color:rgba(0,0,0,0.87)}md-list.md-default-theme md-list-item.md-2-line .md-list-item-text p, md-list md-list-item.md-2-line .md-list-item-text p,md-list.md-default-theme md-list-item.md-3-line .md-list-item-text p, md-list md-list-item.md-3-line .md-list-item-text p{color:rgba(0,0,0,0.54)}md-list.md-default-theme md-list-item>md-icon, md-list md-list-item>md-icon{color:rgba(0,0,0,0.54)}md-list.md-default-theme md-list-item>md-icon.md-highlight, md-list md-list-item>md-icon.md-highlight{color:rgb(63,81,181)}md-menu-content.md-default-theme md-menu-item, md-menu-content md-menu-item{color:rgba(0,0,0,0.87)}md-menu-content.md-default-theme md-menu-item md-icon, md-menu-content md-menu-item md-icon{color:rgba(0,0,0,0.54)}md-menu-content.md-default-theme md-menu-item .md-button[disabled], md-menu-content md-menu-item .md-button[disabled],md-menu-content.md-default-theme md-menu-item .md-button[disabled] md-icon, md-menu-content md-menu-item .md-button[disabled] md-icon{color:rgba(0,0,0,0.38)}md-menu-bar.md-default-theme>button.md-button, md-menu-bar>button.md-button{color:rgba(0,0,0,0.87);border-radius:2px}md-menu-bar.md-default-theme md-menu>button, md-menu-bar md-menu>button{color:rgba(0,0,0,0.87)}md-menu-content.md-default-theme .md-menu>.md-button:after, md-menu-content .md-menu>.md-button:after{color:rgba(0,0,0,0.54)}md-toolbar.md-default-theme.md-menu-toolbar md-toolbar-filler, md-toolbar.md-menu-toolbar md-toolbar-filler{background-color:rgb(63,81,181);color:rgba(255,255,255,0.87)}md-toolbar.md-default-theme.md-menu-toolbar md-toolbar-filler md-icon, md-toolbar.md-menu-toolbar md-toolbar-filler md-icon{color:rgba(255,255,255,0.87)}md-nav-bar.md-default-theme .md-button._md-nav-button.md-unselected, md-nav-bar .md-button._md-nav-button.md-unselected{color:rgba(0,0,0,0.54)}md-nav-bar.md-default-theme .md-button._md-nav-button[disabled], md-nav-bar .md-button._md-nav-button[disabled]{color:rgba(0,0,0,0.38)}md-nav-bar.md-default-theme.md-primary>.md-nav-bar, md-nav-bar.md-primary>.md-nav-bar{background-color:rgb(63,81,181)}md-nav-bar.md-default-theme.md-primary>.md-nav-bar .md-button._md-nav-button, md-nav-bar.md-primary>.md-nav-bar .md-button._md-nav-button{color:rgb(197,202,233)}md-nav-bar.md-default-theme.md-primary>.md-nav-bar .md-button._md-nav-button.md-active, md-nav-bar.md-primary>.md-nav-bar .md-button._md-nav-button.md-active,md-nav-bar.md-default-theme.md-primary>.md-nav-bar .md-button._md-nav-button.md-focused, md-nav-bar.md-primary>.md-nav-bar .md-button._md-nav-button.md-focused{color:rgba(255,255,255,0.87)}md-nav-bar.md-default-theme.md-primary>.md-nav-bar .md-button._md-nav-button.md-focused, md-nav-bar.md-primary>.md-nav-bar .md-button._md-nav-button.md-focused{background:rgba(255,255,255,0.1)}md-toolbar>md-nav-bar.md-default-theme>.md-nav-bar, md-toolbar>md-nav-bar>.md-nav-bar{background-color:rgb(63,81,181)}md-toolbar>md-nav-bar.md-default-theme>.md-nav-bar .md-button._md-nav-button, md-toolbar>md-nav-bar>.md-nav-bar .md-button._md-nav-button{color:rgb(197,202,233)}md-toolbar>md-nav-bar.md-default-theme>.md-nav-bar .md-button._md-nav-button.md-active, md-toolbar>md-nav-bar>.md-nav-bar .md-button._md-nav-button.md-active,md-toolbar>md-nav-bar.md-default-theme>.md-nav-bar .md-button._md-nav-button.md-focused, md-toolbar>md-nav-bar>.md-nav-bar .md-button._md-nav-button.md-focused{color:rgba(255,255,255,0.87)}md-toolbar>md-nav-bar.md-default-theme>.md-nav-bar .md-button._md-nav-button.md-focused, md-toolbar>md-nav-bar>.md-nav-bar .md-button._md-nav-button.md-focused{background:rgba(255,255,255,0.1)}md-progress-circular.md-default-theme path, md-progress-circular path{stroke:rgb(63,81,181)}md-progress-linear.md-default-theme .md-container, md-progress-linear .md-container{background-color:rgb(197,202,233)}md-progress-linear.md-default-theme .md-bar, md-progress-linear .md-bar{background-color:rgb(63,81,181)}md-progress-linear.md-default-theme[md-mode=buffer].md-primary .md-bar1, md-progress-linear[md-mode=buffer].md-primary .md-bar1{background-color:rgb(197,202,233)}md-progress-linear.md-default-theme[md-mode=buffer].md-primary .md-dashed:before, md-progress-linear[md-mode=buffer].md-primary .md-dashed:before{background:radial-gradient(rgb(197,202,233) 0,rgb(197,202,233) 16%,transparent 42%)}md-radio-button.md-default-theme .md-off, md-radio-button .md-off{border-color:rgba(0,0,0,0.54)}md-radio-button.md-default-theme:not([disabled]).md-primary .md-on, md-radio-button:not([disabled]).md-primary .md-on,md-radio-button.md-default-theme:not([disabled]) .md-primary .md-on, md-radio-button:not([disabled]) .md-primary .md-on,md-radio-group.md-default-theme:not([disabled]).md-primary .md-on, md-radio-group:not([disabled]).md-primary .md-on,md-radio-group.md-default-theme:not([disabled]) .md-primary .md-on, md-radio-group:not([disabled]) .md-primary .md-on{background-color:rgba(63,81,181,0.87)}md-radio-button.md-default-theme:not([disabled]).md-primary.md-checked .md-off, md-radio-button:not([disabled]).md-primary.md-checked .md-off,md-radio-button.md-default-theme:not([disabled]) .md-primary.md-checked .md-off, md-radio-button:not([disabled]) .md-primary.md-checked .md-off,md-radio-button.md-default-theme:not([disabled]).md-primary .md-checked .md-off, md-radio-button:not([disabled]).md-primary .md-checked .md-off,md-radio-button.md-default-theme:not([disabled]) .md-primary .md-checked .md-off, md-radio-button:not([disabled]) .md-primary .md-checked .md-off,md-radio-group.md-default-theme:not([disabled]).md-primary.md-checked .md-off, md-radio-group:not([disabled]).md-primary.md-checked .md-off,md-radio-group.md-default-theme:not([disabled]) .md-primary.md-checked .md-off, md-radio-group:not([disabled]) .md-primary.md-checked .md-off,md-radio-group.md-default-theme:not([disabled]).md-primary .md-checked .md-off, md-radio-group:not([disabled]).md-primary .md-checked .md-off,md-radio-group.md-default-theme:not([disabled]) .md-primary .md-checked .md-off, md-radio-group:not([disabled]) .md-primary .md-checked .md-off{border-color:rgba(63,81,181,0.87)}md-radio-button.md-default-theme:not([disabled]).md-primary.md-checked .md-ink-ripple, md-radio-button:not([disabled]).md-primary.md-checked .md-ink-ripple,md-radio-button.md-default-theme:not([disabled]) .md-primary.md-checked .md-ink-ripple, md-radio-button:not([disabled]) .md-primary.md-checked .md-ink-ripple,md-radio-button.md-default-theme:not([disabled]).md-primary .md-checked .md-ink-ripple, md-radio-button:not([disabled]).md-primary .md-checked .md-ink-ripple,md-radio-button.md-default-theme:not([disabled]) .md-primary .md-checked .md-ink-ripple, md-radio-button:not([disabled]) .md-primary .md-checked .md-ink-ripple,md-radio-group.md-default-theme:not([disabled]).md-primary.md-checked .md-ink-ripple, md-radio-group:not([disabled]).md-primary.md-checked .md-ink-ripple,md-radio-group.md-default-theme:not([disabled]) .md-primary.md-checked .md-ink-ripple, md-radio-group:not([disabled]) .md-primary.md-checked .md-ink-ripple,md-radio-group.md-default-theme:not([disabled]).md-primary .md-checked .md-ink-ripple, md-radio-group:not([disabled]).md-primary .md-checked .md-ink-ripple,md-radio-group.md-default-theme:not([disabled]) .md-primary .md-checked .md-ink-ripple, md-radio-group:not([disabled]) .md-primary .md-checked .md-ink-ripple{color:rgba(63,81,181,0.87)}md-radio-button.md-default-theme:not([disabled]).md-primary .md-container .md-ripple, md-radio-button:not([disabled]).md-primary .md-container .md-ripple,md-radio-button.md-default-theme:not([disabled]) .md-primary .md-container .md-ripple, md-radio-button:not([disabled]) .md-primary .md-container .md-ripple,md-radio-group.md-default-theme:not([disabled]).md-primary .md-container .md-ripple, md-radio-group:not([disabled]).md-primary .md-container .md-ripple,md-radio-group.md-default-theme:not([disabled]) .md-primary .md-container .md-ripple, md-radio-group:not([disabled]) .md-primary .md-container .md-ripple{color:rgb(57,73,171)}md-radio-button.md-default-theme[disabled], md-radio-button[disabled],md-radio-group.md-default-theme[disabled], md-radio-group[disabled]{color:rgba(0,0,0,0.38)}md-radio-button.md-default-theme[disabled] .md-container .md-off, md-radio-button[disabled] .md-container .md-off,md-radio-button.md-default-theme[disabled] .md-container .md-on, md-radio-button[disabled] .md-container .md-on,md-radio-group.md-default-theme[disabled] .md-container .md-off, md-radio-group[disabled] .md-container .md-off,md-radio-group.md-default-theme[disabled] .md-container .md-on, md-radio-group[disabled] .md-container .md-on{border-color:rgba(0,0,0,0.38)}md-radio-group.md-default-theme .md-checked:not([disabled]).md-primary .md-ink-ripple, md-radio-group .md-checked:not([disabled]).md-primary .md-ink-ripple,md-radio-group.md-default-theme.md-primary .md-checked:not([disabled]) .md-ink-ripple, md-radio-group.md-primary .md-checked:not([disabled]) .md-ink-ripple{color:rgba(63,81,181,0.26)}md-radio-group.md-default-theme.md-focused:not(:empty) .md-checked.md-primary .md-container:before, md-radio-group.md-focused:not(:empty) .md-checked.md-primary .md-container:before,md-radio-group.md-default-theme.md-focused:not(:empty).md-primary .md-checked .md-container:before, md-radio-group.md-focused:not(:empty).md-primary .md-checked .md-container:before{background-color:rgba(63,81,181,0.26)}md-input-container:not(.md-input-focused):not(.md-input-invalid) md-select.md-default-theme .md-select-value span:first-child:after, md-input-container:not(.md-input-focused):not(.md-input-invalid) md-select .md-select-value span:first-child:after{color:rgba(0,0,0,0.38)}md-input-container.md-input-focused:not(.md-input-has-value) md-select.md-default-theme .md-select-value, md-input-container.md-input-focused:not(.md-input-has-value) md-select .md-select-value,md-input-container.md-input-focused:not(.md-input-has-value) md-select.md-default-theme .md-select-value.md-select-placeholder, md-input-container.md-input-focused:not(.md-input-has-value) md-select .md-select-value.md-select-placeholder{color:rgb(63,81,181)}md-input-container.md-input-invalid md-select.md-default-theme.md-no-underline .md-select-value, md-input-container.md-input-invalid md-select.md-no-underline .md-select-value{border-bottom-color:transparent!important}md-select.md-default-theme .md-select-value, md-select .md-select-value{border-bottom-color:rgba(0,0,0,0.12)}md-select.md-default-theme .md-select-value.md-select-placeholder, md-select .md-select-value.md-select-placeholder{color:rgba(0,0,0,0.38)}md-select.md-default-theme.md-no-underline .md-select-value, md-select.md-no-underline .md-select-value{border-bottom-color:transparent!important}md-select.md-default-theme.ng-invalid.ng-touched.md-no-underline .md-select-value, md-select.ng-invalid.ng-touched.md-no-underline .md-select-value{border-bottom-color:transparent!important}md-select.md-default-theme:not([disabled]):focus .md-select-value, md-select:not([disabled]):focus .md-select-value{border-bottom-color:rgb(63,81,181);color:rgba(0,0,0,0.87)}md-select.md-default-theme:not([disabled]):focus .md-select-value.md-select-placeholder, md-select:not([disabled]):focus .md-select-value.md-select-placeholder{color:rgba(0,0,0,0.87)}md-select.md-default-theme:not([disabled]):focus.md-no-underline .md-select-value, md-select:not([disabled]):focus.md-no-underline .md-select-value{border-bottom-color:transparent!important}md-select.md-default-theme[disabled] .md-select-icon, md-select[disabled] .md-select-icon,md-select.md-default-theme[disabled] .md-select-value, md-select[disabled] .md-select-value,md-select.md-default-theme[disabled] .md-select-value.md-select-placeholder, md-select[disabled] .md-select-value.md-select-placeholder{color:rgba(0,0,0,0.38)}md-select.md-default-theme .md-select-icon, md-select .md-select-icon{color:rgba(0,0,0,0.54)}md-select-menu.md-default-theme md-content md-optgroup, md-select-menu md-content md-optgroup{color:rgba(0,0,0,0.54)}md-select-menu.md-default-theme md-content md-option, md-select-menu md-content md-option{color:rgba(0,0,0,0.87)}md-select-menu.md-default-theme md-content md-option[disabled] .md-text, md-select-menu md-content md-option[disabled] .md-text{color:rgba(0,0,0,0.38)}md-select-menu.md-default-theme md-content md-option[selected], md-select-menu md-content md-option[selected]{color:rgb(63,81,181)}md-select-menu.md-default-theme md-content md-option[selected]:focus, md-select-menu md-content md-option[selected]:focus{color:rgb(57,73,171)}.md-checkbox-enabled.md-default-theme .md-ripple, .md-checkbox-enabled .md-ripple{color:rgb(57,73,171)}.md-checkbox-enabled.md-default-theme .md-ink-ripple, .md-checkbox-enabled .md-ink-ripple{color:rgba(0,0,0,0.54)}.md-checkbox-enabled.md-default-theme[selected] .md-ink-ripple, .md-checkbox-enabled[selected] .md-ink-ripple{color:rgba(63,81,181,0.87)}.md-checkbox-enabled.md-default-theme:not(.md-checked) .md-icon, .md-checkbox-enabled:not(.md-checked) .md-icon{border-color:rgba(0,0,0,0.54)}.md-checkbox-enabled.md-default-theme[selected] .md-icon, .md-checkbox-enabled[selected] .md-icon{background-color:rgba(63,81,181,0.87)}.md-checkbox-enabled.md-default-theme[selected].md-focused .md-container:before, .md-checkbox-enabled[selected].md-focused .md-container:before{background-color:rgba(63,81,181,0.26)}.md-checkbox-enabled.md-default-theme[selected] .md-icon:after, .md-checkbox-enabled[selected] .md-icon:after{border-color:rgba(255,255,255,0.87)}.md-checkbox-enabled.md-default-theme .md-indeterminate[disabled] .md-container, .md-checkbox-enabled .md-indeterminate[disabled] .md-container{color:rgba(0,0,0,0.38)}.md-checkbox-enabled.md-default-theme md-option .md-text, .md-checkbox-enabled md-option .md-text{color:rgba(0,0,0,0.87)}md-slider.md-default-theme.md-primary .md-focus-ring, md-slider.md-primary .md-focus-ring{background-color:rgba(159,168,218,0.38)}md-slider.md-default-theme.md-primary .md-track.md-track-fill, md-slider.md-primary .md-track.md-track-fill{background-color:rgb(63,81,181)}md-slider.md-default-theme.md-primary .md-thumb:after, md-slider.md-primary .md-thumb:after{border-color:rgb(63,81,181);background-color:rgb(63,81,181)}md-slider.md-default-theme.md-primary .md-sign, md-slider.md-primary .md-sign{background-color:rgb(63,81,181)}md-slider.md-default-theme.md-primary .md-sign:after, md-slider.md-primary .md-sign:after{border-top-color:rgb(63,81,181)}md-slider.md-default-theme.md-primary[md-vertical] .md-sign:after, md-slider.md-primary[md-vertical] .md-sign:after{border-top-color:transparent;border-left-color:rgb(63,81,181)}md-slider.md-default-theme.md-primary .md-thumb-text, md-slider.md-primary .md-thumb-text{color:rgba(255,255,255,0.87)}md-slider.md-default-theme[disabled] .md-thumb:after, md-slider[disabled] .md-thumb:after{border-color:transparent}md-slider-container[disabled]>:first-child:not(md-slider),md-slider-container[disabled]>:last-child:not(md-slider){color:rgba(0,0,0,0.38)}.md-subheader.md-default-theme.md-primary, .md-subheader.md-primary{color:rgb(63,81,181)}md-switch.md-default-theme.md-checked:not([disabled]).md-primary .md-ink-ripple, md-switch.md-checked:not([disabled]).md-primary .md-ink-ripple{color:rgb(63,81,181)}md-switch.md-default-theme.md-checked:not([disabled]).md-primary .md-thumb, md-switch.md-checked:not([disabled]).md-primary .md-thumb{background-color:rgb(63,81,181)}md-switch.md-default-theme.md-checked:not([disabled]).md-primary .md-bar, md-switch.md-checked:not([disabled]).md-primary .md-bar{background-color:rgba(63,81,181,0.5)}md-switch.md-default-theme.md-checked:not([disabled]).md-primary.md-focused .md-thumb:before, md-switch.md-checked:not([disabled]).md-primary.md-focused .md-thumb:before{background-color:rgba(63,81,181,0.26)}md-tabs.md-default-theme .md-paginator md-icon, md-tabs .md-paginator md-icon{color:rgb(63,81,181)}md-tabs.md-default-theme .md-tab, md-tabs .md-tab{color:rgba(0,0,0,0.54)}md-tabs.md-default-theme .md-tab[disabled], md-tabs .md-tab[disabled],md-tabs.md-default-theme .md-tab[disabled] md-icon, md-tabs .md-tab[disabled] md-icon{color:rgba(0,0,0,0.38)}md-tabs.md-default-theme .md-tab.md-active, md-tabs .md-tab.md-active,md-tabs.md-default-theme .md-tab.md-active md-icon, md-tabs .md-tab.md-active md-icon,md-tabs.md-default-theme .md-tab.md-focused, md-tabs .md-tab.md-focused,md-tabs.md-default-theme .md-tab.md-focused md-icon, md-tabs .md-tab.md-focused md-icon{color:rgb(63,81,181)}md-tabs.md-default-theme .md-tab.md-focused, md-tabs .md-tab.md-focused{background:rgba(63,81,181,0.1)}md-tabs.md-default-theme.md-primary>md-tabs-wrapper, md-tabs.md-primary>md-tabs-wrapper{background-color:rgb(63,81,181)}md-tabs.md-default-theme.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]), md-tabs.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]),md-tabs.md-default-theme.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]) md-icon, md-tabs.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]) md-icon{color:rgb(197,202,233)}md-tabs.md-default-theme.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-active, md-tabs.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-active,md-tabs.md-default-theme.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-active md-icon, md-tabs.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-active md-icon,md-tabs.md-default-theme.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused, md-tabs.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused,md-tabs.md-default-theme.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused md-icon, md-tabs.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused md-icon{color:rgba(255,255,255,0.87)}md-tabs.md-default-theme.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused, md-tabs.md-primary>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused{background:rgba(255,255,255,0.1)}md-toolbar>md-tabs.md-default-theme>md-tabs-wrapper, md-toolbar>md-tabs>md-tabs-wrapper{background-color:rgb(63,81,181)}md-toolbar>md-tabs.md-default-theme>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]), md-toolbar>md-tabs>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]),md-toolbar>md-tabs.md-default-theme>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]) md-icon, md-toolbar>md-tabs>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]) md-icon{color:rgb(197,202,233)}md-toolbar>md-tabs.md-default-theme>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-active, md-toolbar>md-tabs>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-active,md-toolbar>md-tabs.md-default-theme>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-active md-icon, md-toolbar>md-tabs>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-active md-icon,md-toolbar>md-tabs.md-default-theme>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused, md-toolbar>md-tabs>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused,md-toolbar>md-tabs.md-default-theme>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused md-icon, md-toolbar>md-tabs>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused md-icon{color:rgba(255,255,255,0.87)}md-toolbar>md-tabs.md-default-theme>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused, md-toolbar>md-tabs>md-tabs-wrapper>md-tabs-canvas>md-pagination-wrapper>md-tab-item:not([disabled]).md-focused{background:rgba(255,255,255,0.1)}md-toast.md-default-theme .md-toast-content .md-button.md-highlight.md-primary, md-toast .md-toast-content .md-button.md-highlight.md-primary{color:rgb(63,81,181)}md-toolbar.md-default-theme:not(.md-menu-toolbar), md-toolbar:not(.md-menu-toolbar){background-color:rgb(63,81,181);color:rgba(255,255,255,0.87)}md-toolbar.md-default-theme:not(.md-menu-toolbar) md-icon, md-toolbar:not(.md-menu-toolbar) md-icon{color:rgba(255,255,255,0.87);fill:rgba(255,255,255,0.87)}md-toolbar.md-default-theme:not(.md-menu-toolbar) .md-button[disabled] md-icon, md-toolbar:not(.md-menu-toolbar) .md-button[disabled] md-icon{color:rgba(255,255,255,0.26);fill:rgba(255,255,255,0.26)}
</style>

<style type="text/css">
body {
  background-color: var(--jp-layout-color0);
  overflow-y: scroll;
}

.nav-wrapper {
  background-color: {{ bar_color }};
}

/* Normal white Button as seen on Google.com*/
button {
  color: #444444;
  background: #F3F3F3;
  border: 1px #DADADA solid;
  padding: 5px 10px;
  border-radius: 2px;
  font-weight: bold;
  font-size: 9pt;
  outline: none;
}

button:hover {
  border: 1px #C6C6C6 solid;
  box-shadow: 1px 1px 1px #EAEAEA;
  color: #333333;
  background: #F7F7F7;
}

button:active {
  box-shadow: inset 1px 1px 1px #DFDFDF;
}

/* Blue button as seen on translate.google.com*/
button.blue {
  color: white;
  background: #4C8FFB;
  border: 1px #3079ED solid;
  box-shadow: inset 0 1px 0 #80B0FB;
}

button.blue:hover {
  border: 1px #2F5BB7 solid;
  box-shadow: 0 1px 1px #EAEAEA, inset 0 1px 0 #5A94F1;
  background: #3F83F1;
}

button.blue:active {
  box-shadow: inset 0 2px 5px #2370FE;
}

/* Orange button as seen on blogger.com*/
button.orange {
  color: white;
  border: 1px solid #FB8F3D;
  background: -webkit-linear-gradient(top, #FDA251, #FB8F3D);
  background: -moz-linear-gradient(top, #FDA251, #FB8F3D);
  background: -ms-linear-gradient(top, #FDA251, #FB8F3D);
}

button.orange:hover {
  border: 1px solid #EB5200;
  background: -webkit-linear-gradient(top, #FD924C, #F9760B);
  background: -moz-linear-gradient(top, #FD924C, #F9760B);
  background: -ms-linear-gradient(top, #FD924C, #F9760B);
  box-shadow: 0 1px #EFEFEF;
}

button.orange:active {
  box-shadow: inset 0 1px 1px rgba(0,0,0,0.3);
}

/* Red Google Button as seen on drive.google.com */
button.red {
  background: -webkit-linear-gradient(top, #DD4B39, #D14836);
  background: -moz-linear-gradient(top, #DD4B39, #D14836);
  background: -ms-linear-gradient(top, #DD4B39, #D14836);
  border: 1px solid #DD4B39;
  color: white;
  text-shadow: 0 1px 0 #C04131;
}

button.red:hover {
  background: -webkit-linear-gradient(top, #DD4B39, #C53727);
  background: -moz-linear-gradient(top, #DD4B39, #C53727);
  background: -ms-linear-gradient(top, #DD4B39, #C53727);
  border: 1px solid #AF301F;
}

button.red:active {
  box-shadow: inset 0 1px 1px rgba(0,0,0,0.2);
  background: -webkit-linear-gradient(top, #D74736, #AD2719);
  background: -moz-linear-gradient(top, #D74736, #AD2719);
  background: -ms-linear-gradient(top, #D74736, #AD2719);
}

.brand-logo {
  height: 90%;
  width: 100%;
}

#loading {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 75vh;
  color: var(--jp-content-font-color1);
  font-family: sans-serif;
}

.spinner {
  animation: rotation 2s infinite linear;
  transform-origin: 50% 50%;
}

.spinner-container {
  width: 10%;
}

@keyframes rotation {
  from {transform: rotate(0deg);}
  to   {transform: rotate(359deg);}
}

.voila-spinner-color1{
  fill: {{ bar_color }};
}

.voila-spinner-color2{
  fill: #f8e14b;
}

@font-face {
  font-family: 'Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url({{resources.base_url}}voila/static/icons_font.ttf) format('truetype');
}

.material-icons {
  font-family: 'Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
</style>

{% for css in resources.inlining.css %}
<style type="text/css">
{{ css }}
</style>
{% endfor %}

<style>
a.anchor-link {
  display: none;
}
.highlight  {
  margin: 0.4em;
}
</style>


{{ mathjax() }}
{%- endblock html_head_css -%}

{%- block body -%}
{%- block body_header -%}
<body data-base-url="{{resources.base_url}}voila/">
  <div id="fb-root"></div>
  <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v7.0"></script>
  <div id="loading">
    <div class="spinner-container">
      <svg class="spinner" data-name="c1" version="1.1" viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title>voila</dc:title></cc:Work></rdf:RDF></metadata><title>spin</title><path class="voila-spinner-color1" d="m250 405c-85.47 0-155-69.53-155-155s69.53-155 155-155 155 69.53 155 155-69.53 155-155 155zm0-275.5a120.5 120.5 0 1 0 120.5 120.5 120.6 120.6 0 0 0-120.5-120.5z"/><path class="voila-spinner-color2" d="m250 405c-85.47 0-155-69.53-155-155a17.26 17.26 0 1 1 34.51 0 120.6 120.6 0 0 0 120.5 120.5 17.26 17.26 0 1 1 0 34.51z"/></svg>
    </div>
    <h5 id="loading_text">Running {{nb_title}}...</h5>
  </div>
  <script>
  var voila_process = function(cell_index, cell_count) {
    var el = document.getElementById("loading_text")
    el.innerHTML = `Executing ${cell_index} of ${cell_count}`
  }
</script>

<script src="{{ resources.base_url }}voila/static/jquery-3.5.1.min.js"></script>
<script src="{{ resources.base_url }}voila/static/bootstrap.min.js"></script>

<div id="rendered_cells" style="display: none">
  {%- endblock body_header -%}

  <div class="mcloud-header header" id="mcloudHeader">
    <div class="navbar navbar-default navbar-static-top">
      <div class="container-fluid"> <div class="navbar-header">
        <button class="navbar-toggle" data-target=".header-collapse" data-toggle="collapse" type="button">
          <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
          <span class="icon-bar"></span> <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" ui-sref="main.home" href="/home">
          <img src="{{ resources.base_url }}voila/static/mcloud-logo-98x79.png"> </a>
        </div>
        <div class="collapse navbar-collapse header-collapse">
          <ul class="nav navbar-nav">
            <li><a href="https://www.materialscloud.org/learn" ng-click="changePath('learn')">LEARN</a></li>
            <li><a href="https://www.materialscloud.org/work" ng-click="changePath('work')">WORK</a></li>
            <li><a href="https://www.materialscloud.org/discover" ng-click="changePath('discover')">DISCOVER</a></li>
            <li><a href="https://www.materialscloud.org/explore" ng-click="changePath('explore')">EXPLORE</a></li>
            <li><a href="https://www.materialscloud.org/archive" ng-click="changePath('archive')">ARCHIVE</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">More <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li ng-class="{ active: isActive('/policies')}"><a ui-sref="main.policies" href="https://www.materialscloud.org/policies">Policies</a></li>
                <li ng-class="{ active: isActive('/dmp')}"><a ui-sref="main.dmp" href="https://www.materialscloud.org/dmp">Data Management Plan</a></li>
                <li ng-class="{ active: isActive('/termssummary')}"><a ui-sref="main.termssummary" href="https://www.materialscloud.org/termssummary">Terms of Use</a></li>
                <!-- <li ng-class="{ active: isActive('/vision')}"><a ui-sref="main.vision">Vision</a></li> -->
                <li ng-class="{ active: isActive('/infrastructure')}"><a ui-sref="main.infrastructure" href="https://www.materialscloud.org/infrastructure">Infrastructure</a></li>
                <li ng-class="{ active: isActive('/team')}"><a ui-sref="main.team" href="https://www.materialscloud.org/team">Team &amp; Contact</a></li>
                <li><a href="https://www.materialscloud.org/home#partners" ng-click="changePath('home#partners')">Partners</a></li>
                <li><a href="https://www.materialscloud.org/explore/connect" ng-click="changePath('explore/connect')">Connect your REST API</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- End of header -->
  </div>

  <main style="padding: 5px; background-color: #f0f6f9" >
    <div class="fb-share-button" style="position: absolute; margin-left: 1px; margin-top: 2px;" data-href=window.location.href data-layout="button_count" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share</a></div>
    <button class="orange" onclick="myFunction()" style="margin-right: 3px; position: relative; left: 92%">JupyterLab</button>
    <div class="container" style="margin: 40px auto">
      <div class="row">
        <div class="col s12" id="col_s12" style="margin-bottom: 30px">
          {% if resources.theme == 'dark' %}
          <div class="jp-Notebook theme-dark">
            {% else %}
            <div class="jp-Notebook theme-light">
              {% endif %}
              {%- block body_loop -%}
              {# from this point on, the kernel is started #}
              {%- with kernel_id = kernel_start() -%}
              <script id="jupyter-config-data" type="application/json">
              {
                "baseUrl": "{{resources.base_url}}",
                "kernelId": "{{kernel_id}}"
              }
              </script>
              {% set cell_count = nb.cells|length %}
              {%- for cell in cell_generator(nb, kernel_id) -%}
              {% set cellloop = loop %}
              {%- block any_cell scoped -%}
              <script>
              voila_process({{ cellloop.index }}, {{ cell_count }})
              </script>
              {{ super() }}
              {%- endblock any_cell -%}
              {%- endfor -%}
              {% endwith %}
              {%- endblock body_loop -%}
              <div id="rendered_cells" style="display: none">
              </div>
            </div>
            <hr style="border-top: 3px solid #8c8b8b;">
            <a style="left: 10%" href="https://www.materialscloud.org">https://www.materialscloud.org</a>
          </div>
        </div>
      </main>

      {%- block body_footer -%}
      <script type="text/javascript">
      (function() {
        // remove the loading element
        var el = document.getElementById("loading")
        el.parentNode.removeChild(el)
        // show the cell output
        el = document.getElementById("rendered_cells")
        el.style.display = 'unset'
      })();
      </script>

      <script src="{{resources.base_url}}voila/static/materialize.min.js"></script>
    </body>
    {%- endblock body_footer -%}

    {% block footer_js %}
    {{ super() }}

    <script type="text/javascript">

    requirejs(['static/voila'], function(voila) {
      (async function() {
        var kernel = await voila.connectKernel();

        kernel.statusChanged.connect(() => {
          // console.log(kernel.status);
          var el = document.getElementById("kernel-status-icon");

          if (kernel.status == 'busy') {
            el.innerHTML = 'radio_button_checked';
          } else {
            el.innerHTML = 'radio_button_unchecked';
          }
        });
      })();
    });

    function myFunction(){
      var url = window.location.pathname.replace("voila/render", "lab/tree")
      window.open(url, "_self");
    }
    </script>

    {% endblock footer_js %}

    {%- endblock body -%}
