function! pomodorohandlers#pause()
    " Load the result in a split
    let env = {}
    function env.get(temp_file_name) dict
 		let choice = confirm("Start pause?", "&Yes\n&No")
		"call asynccommand#run("sleep 5", )
    endfunction
    return asynccommand#tab_restore(env)
endfunction
