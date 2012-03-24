" plugin/pomodoro.vim
" Author:   Maximilian Nickel <max@inmachina.com>
" License:  MIT License


if &cp || exists("g:pomodoro_loaded") && g:pomodoro_loaded
  "finish
endif

let g:pomodoro_loaded = 1
let g:pomodoro_started = 0
let g:pomodoro_time_work = 10 
let g:pomodoro_time_slack = 5
let g:pomodoro_do_log = 1
let g:pomodoro_log_file = "/tmp/pomodoro.log"

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=* PomodoroStart call s:PomodoroStart(<q-args>)

function! s:PomodoroStart(name)
	if g:pomodoro_started != 1
		if a:name == ''
			let name = '(unnamed)'
		else 
			let name = a:name
		endif
		call asynccommand#run("sleep " . g:pomodoro_time_work, pomodorohandlers#pause(name))
		let g:pomodoro_started = 1 
	endif
endfunction
