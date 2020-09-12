# Function to define config dir
function configDir(path="")
	home = homedir();
	if !isdir("$home/.julia/config")
		mkdir("$home/.julia/config")
	end
	return "$home/.julia/config/$path"
end

# GitHub repos base dir
function gitDir(path="")
	if isdir("/data/GitHub")
		return "/data/GitHub/$path"
	elseif isdir("/data/fusion809/GitHub")
		return "/data/fusion809/GitHub/$path"
	end
end

# Import OR modules
function operats()
	include(configDir("operations.jl"))
end

# Define useful shell-style functions
# Text editors
function code(path=pwd())
	run(`code $path`)
end

function vim(path=pwd())
	run(`vim $path`)
end

function atom(path=pwd())
	run(`atom $path`)
end

# Functions relating to the RC file
function pathrc()
	home = homedir();
	return "$home/.julia/config/startup.jl"
end

function src()
	include(pathrc())
end

function vrc()
	vim(pathrc())
	src()
end

# git functions
function gitc(repo)
	run(`git clone $repo`)
end

# Functions relating to FunctionIntegrator.jl
function intDir(path="")
	home = homedir();
	FIPath = "$home/.julia/dev/FunctionIntegrator";
	if !isdir(FIPath)
		gitc("git@github.com:fusion809/FunctionIntegrator.jl.git")
	end
	return string(FIPath, "/$path")
end

function cdint(path="")
	cd(intDir(path))
end

function vint(path="")
	vim(intDir(path))
end

function cint(path="")
	code(intDir(path))
end

function aint(path="")
	atom(intDir(path))
end

# Functions related to fusion809.github.io
function fgiDir(path="")
	return gitDir("mine/websites/fusion809.github.io/$path")
end

function frank()
	# Import Franklin module; not possible to import it directly see 
	# https://discourse.julialang.org/t/why-wont-julia-let-me-put-a-module-import-within-a-function/46504/3
	# for why
	include(configDir("franklin-import.jl"))
	serve()
end

function cdfgi(path="")
	cd(fgiDir(path))
end

function vfgi(path="")
	webDir = fgiDir(path);
	vim(webDir)
end

function fgiServ()
	cd(fgiDir())
	frank()
end

# Relating to Julia repo
function julDir(path="")
	return gitDir("mine/maths/julia-scripts/$path");
end

function vjus(path="")
	juliaDir = julDir(path);
	vim(juliaDir)
end

function ajus(path="")
	juliaDir = julDir(path);
	atom(julaDir)
end

function cjus(path="")
	juliaDir = julDir(path);
	code(juliaDir)
end

function jupyterlab(path=julDir())
	cd(path)
	run(`jupyter lab`)
end

# Unix shell mimicry
function ls(path=pwd())
	readdir(path)
end
