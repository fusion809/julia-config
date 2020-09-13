# Import OR modules
macro operats()
    quote
        using GLPK, Clp, JuMP, Hungarian
    end
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