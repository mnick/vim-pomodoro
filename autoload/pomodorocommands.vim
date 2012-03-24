" autoload/pomodorocommands.vim
" Author:   Maximilian Nickel <max@inmachina.com>
" License:  MIT License

if exists("g:loaded_autoload_pomodorocommands") || &cp || !has('clientserver')
    " requires nocompatible and clientserver
    " also, don't double load
    finish
endif
let g:loaded_autoload_pomodorocommands = 1

function! pomodorocommands#notify()
	if exists("g:pomodoro_notification_cmd") 
		call asynccommand#run(g:pomodoro_notification_cmd)
	endif
endfunction

function! pomodorocommands#remaining_time() 
	return (g:pomodoro_time_work * 60 - abs(localtime() - g:pomodoro_started_at)) / 60
endfunction


