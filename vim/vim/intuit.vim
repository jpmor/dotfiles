" mc configs

let g:gutentags_ctags_extra_args = ['--options=' . expand('~/.ctags.cnf')]

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1

let g:ale_php_phpcs_standard=$MA . "/vendor/rsg/mc-codesniffer-ruleset/MCStandard"
let g:ale_php_phpcs_options="--exclude=Generic.Files.LineLength -d memory_limit=-1"
