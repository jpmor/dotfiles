" mc configs

set tags=.git/tags

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_php_phpcs_standard=$CS_STANDARD
let g:ale_php_phpcs_options="--exclude=Generic.Files.LineLength -d memory_limit=-1"
