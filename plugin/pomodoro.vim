" plugin/pomodoro.vim
" Author:   Maximilian Nickel <maxh@inmachina.com>
" License:  MIT License

" Install this file as plugin/makegreen.vim.


if &cp || exists("g:pomodoro_loaded") && g:pomodoro_loaded
  "finish
endif
let g:pomodoro_loaded = 1

function! StartPomodoro()
	call asynccommand#run("sleep 10", pomodorohandlers#pause())
endfunction
