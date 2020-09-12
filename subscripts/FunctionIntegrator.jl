# Functions relating to FunctionIntegrator.jl
function intDir(path::String="")
	home = homedir();
	FIPath = "$home/.julia/dev/FunctionIntegrator";
	if !isdir(FIPath)
		gitc("git@github.com:fusion809/FunctionIntegrator.jl.git")
	end
	return string(FIPath, "/$path")
end

function cdint(path::String="")
	cd(intDir(path))
end

function vint(path::String="")
	vim(intDir(path))
end

function cint(path::String="")
	code(intDir(path))
end

function aint(path::String="")
	atom(intDir(path))
end