if exists("g:loaded_llm_audit")
	finish
endif
let g:loaded_llm_audit=1

if !exists("g:llm_audit_prefix")
	let g:llm_audit_prefix="\"There is a piece of code Show me vulnerabilities in this code. Answer like \\\"$line_number $what_kind_of_vulnerability $way_to_fix\\\"\""
endif

if !exists("g:llm_audit_model")
	let g:llm_audit_model="\"llama2_70b\""
endif

if !exists("g:llm_audit_addition")
	let g:llm_audit_addition="\"\""
endif

if !exists("g:llm_audit_role")
	let g:llm_audit_role="\"user\""
endif

command! -nargs=0 GetAnswer call llm_audit#get_answer()
command! -nargs=0 ShowAnswer call llm_audit#show_answer()
command! -nargs=0 AskAndShowAnswer call llm_audit#ask_and_show_answer()

map llm :<C-U>AskAndShowAnswer<cr>
