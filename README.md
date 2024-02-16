# Audit code with LLMs
### Installation
For now there are packages only for Nix package manager
[llm_audit.pkgs](https://github.com/TheSaintDiratof/llm_audit.pkgs)
Or just plug it locally :^)
### Configuration
There are several parameters
```vim
" set prefix
" default is \"There is a piece of code Show me vulnerabilities in this code. Answer like \\\"$line_number $what_kind_of_vulnerability $way_to_fix\\\"\"
let g:llm_audit_prefix="prefix"
" set model
" default is \"llama2_70b\"
" available models will be soon
let g:llm_audit_model="model" 
" set addition
" default is none
let g:llm_audit_addition="addition"
" set role
" default is \"user\"
let g:llm_audit_role="role"
```
### Usage
There are only one exposed function and it's "AskAndShowAnswer"
By default it's binded to "llm"
