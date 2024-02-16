" Vim global plugin that does audit of code via Large Language Models
" Last Change: 2024 Jan 28
" Maintainer:  Diratof Azdimarlow <TG: @DAzdimarlow>
" License:     This file is placed in the public domain.
"
function! s:get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! llm_audit#get_answer()
	let code = s:get_visual_selection()	

	let command = ["echo", "\'", code, "\'", " | ", "python -m llm_audit", "-p", g:llm_audit_prefix, "-a", g:llm_audit_addition, "-m", g:llm_audit_model, "-r", g:llm_audit_role]
	let cmdexec= join(command, " ")
	let s:answer = system(cmdexec)
	return s:answer
endfunction

function! llm_audit#show_answer()
	echo s:answer
endfunction

function! llm_audit#ask_and_show_answer()
	echo llm_audit#get_answer()
endfunction

