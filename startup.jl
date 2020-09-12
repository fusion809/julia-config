# Function to define config dir
"""
	configDir(path::String="")

Returns ~/.julia/config/path. If ~/.julia/config doesn't exist, it will be created.
"""
function configDir(path::String="")
	home = homedir();
	if !isdir("$home/.julia/config")
		mkdir("$home/.julia/config")
	end
	return "$home/.julia/config/$path"
end

function cdcf(path::String="")
	cfDir = configDir(path);
	cd(cfDir);
end

function push(msg::String)
	run(`git add --all`);
	run(`git commit -m "$msg"`);
	branch = read(`git rev-parse --abbrev-ref HEAD`);
	run(`git push origin $branch`)
end

# GitHub repos base dir
"""
	gitDir(path::String="")
"""
function gitDir(path::String="")
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
function code(path::String=pwd())
	run(`code $path`)
end

function vim(path::String=pwd())
	run(`vim $path`)
end

function atom(path::String=pwd())
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

# Functions related to fusion809.github.io
function fgiDir(path::String="")
	return gitDir("mine/websites/fusion809.github.io/$path")
end

"""
	frank()

Launches Franklin, after first importing its module.
"""
function frank()
	# Import Franklin module; not possible to import it directly see 
	# https://discourse.julialang.org/t/why-wont-julia-let-me-put-a-module-import-within-a-function/46504/3
	# for why
	include(configDir("franklin-import.jl"))
	serve()
end

"""
	cdfgi(path::String)

Changes into the directory of fusion809.github.io.
"""
function cdfgi(path::String="")
	cd(fgiDir(path))
end

function vfgi(path::String="")
	webDir = fgiDir(path);
	vim(webDir)
end

function fgiServ()
	cd(fgiDir())
	frank()
end

# Relating to Julia repo
function julDir(path::String="")
	return gitDir("mine/maths/julia-scripts/$path");
end

function vjus(path::String="")
	juliaDir = julDir(path);
	vim(juliaDir)
end

function ajus(path::String="")
	juliaDir = julDir(path);
	atom(julaDir)
end

function cjus(path::String="")
	juliaDir = julDir(path);
	code(juliaDir)
end

"""
	jupyterlab(path::String=julDir())

Changes directory to path and starts Jupyter Lab.
"""
function jupyterlab(path::String=julDir())
	cd(path)
	run(`jupyter lab`)
end

# Unix shell mimicry
function ls(path::String=pwd())
	readdir(path)
end

function yay(args::String)
	run(`yay $args`)
end

function apmu()
	run(`apm update --confirm=false`)
end

function pkg()
	include(configDir(pkg.jl))
end

function update()
	yay("-Syu")
	apmu
	pkg()
	Pkg.update()
end
