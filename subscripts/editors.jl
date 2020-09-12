# Define useful shell-style functions
# Text editors
function code(path::String=pwd())
	run(`code $path`)
end

function vim(path::String=pwd())
	run(`vim $path`)
end

function atom(path::String=pwd())
	run(`atom $path`)
end