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

# Import additional functions from separate scripts in subscripts/
inclCfgSc("subscripts/config.jl")
inclCfgSc("subscripts/git.jl")
inclCfgSc("subscripts/FunctionIntegrator.jl")
inclCfgSc("subscripts/editors.jl")
inclCfgSc("subscripts/github.jl")
inclCfgSc("subscripts/julia-scripts.jl")
inclCfgSc("subscripts/FGI.jl")
inclCfgSc("subscripts/update.jl")
inclCfgSc("subscripts/miscellaneous.jl")
