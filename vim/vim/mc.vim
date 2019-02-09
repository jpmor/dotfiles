" mc configs

set tags=.git/tags

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_php_phpcs_standard='$MC/product/mailchimp/vendor/rsg/mc-codesniffer-ruleset/MCStandard --exclude=Generic.Files.LineLength,Squiz.WhiteSpace.SuperfluousWhitespace -d memory_limit=-1'
