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
	includeConfigScript(filename::String)

Runs `include()` on a file within ~/.julia/config/ whose name is specified by the argument `filename`.
"""
function includeConfigScript(filename::String)
	include(configDir(string("subscripts/", filename)));
end

# Import additional functions from separate scripts in subscripts/
includeConfigScript("config.jl")
includeConfigScript("git.jl")
includeConfigScript("FunctionIntegrator.jl")
includeConfigScript("editors.jl")
includeConfigScript("github.jl")
includeConfigScript("julia-scripts.jl")
includeConfigScript("FGI.jl")
includeConfigScript("update.jl")
includeConfigScript("miscellaneous.jl")

using OhMyREPL;

colorscheme!("Monokai256")

OhMyREPL.Passes.RainbowBrackets.activate_256colors()

