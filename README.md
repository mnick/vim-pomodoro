vim-pomodoro
============

vim-pomodoro is a Vim plugin for the [Pomodoro time management technique](http://www.pomodorotechnique.com/).

Usage
-----
The usage of vim-pomodoro is simple. `:PomodoroStart [pomodoro_name]` starts a new pomodoro. 
The parameter `pomodoro_name` is optional. After a pomodoro ended, a confirmation dialog will 
remind you to take a break. When the break has ended, another dialog will ask you if you want 
to start a new pomodoro. 

Configuration
-------------
Add the following options to your `~/.vimrc` to configure vim-pomodoro 

	" Duration of a pomodoro in minutes (default: 15)
	let g:pomodoro_time_work = 15

	" Duration of a break in minutes (default: 5)
	let g:pomodoro_time_slack = 5 

	" Log completed pomodoros, 0 = False, 1 = True (default: 0)
	let g:pomodoro_do_log = 0 

	" Path of the pomodoro log file (default: /tmp/pomodoro.log)
	let g:pomodoro_log_file = "/tmp/pomodoro.log" 

Installation
------------
Recommended installation method is via [Vundle](https://github.com/gmarik/vundle). 
Add 

	Bundle "mnick/vim-pomodoro"

to your `~/.vimrc` and run `BundleInstall` afterwards.
