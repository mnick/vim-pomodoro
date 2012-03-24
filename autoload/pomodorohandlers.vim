" autoload/pomodorohandlers.vim
" Author:   Maximilian Nickel <max@inmachina.com>
" License:  MIT License

if exists("g:loaded_autoload_pomodorohandlers") || &cp || !has('clientserver')
    " requires nocompatible and clientserver
    " also, don't double load
    finish
endif
let g:loaded_autoload_pomodorohandlers = 1

function! pomodorohandlers#pause(name)
    " Load the result in a split
    let env = {'name' : a:name}
    function env.get(temp_file_name) dict
		call pomodorocommands#notify()
 		let choice = confirm("Great, pomodoro " . self.name . " is finished!\nNow, take a break for " . g:pomodoro_time_slack . " minutes", "&OK")
		let g:pomodoro_started = 0 
		if exists("g:pomodoro_log_file")
			exe "!echo 'Pomodoro " . self.name . " ended at " . strftime("%c") . ", duration: " . g:pomodoro_time_work . " minutes' >> " . g:pomodoro_log_file
		endif
		call asynccommand#run("sleep " . g:pomodoro_time_slack * 60, pomodorohandlers#restart())
    endfunction 
    return asynccommand#tab_restore(env)
endfunction

function! pomodorohandlers#restart()
    " Load the result in a split
    let env = {}
    function env.get(temp_file_name) dict
		call pomodorocommands#notify()
 		let choice = confirm(g:pomodoro_time_slack . " minutes break is over... Feeling rested?\nWant to start another pomodoro?", "&Yes\n&No")
		if choice == 1
			call StartPomodoro()
		endif
    endfunction
    return asynccommand#tab_restore(env)
endfunction
