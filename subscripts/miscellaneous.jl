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