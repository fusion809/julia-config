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

"""
	inclCfgSc(filename::String)

Runs `include()` on a file within ~/.julia/config/ whose name is specified by the argument `filename`.
"""
function inclCfgSc(filename::String)
	include(configDir(filename));
end

inclCfgSc("config.jl")
inclCfgSc("git.jl")
inclCfgSc("FunctionIntegrator.jl")
inclCfgSc("editors.jl")
inclCfgSc("github.jl")
inclCfgSc("julia-scripts.jl")
inclCfgSc("FGI.jl")
inclCfgSc("update.jl")

# Import OR modules
function operats()
	include(configDir("imports/operations.jl"))
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
