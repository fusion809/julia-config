# Functions related to fusion809.github.io
function fgiDir(path::String="")
	return gitDir("mine/websites/fusion809.github.io/$path")
end

macro frankimport()
 	quote
 		using Franklin
 	end
end

"""
	frank()

Launches Franklin, after first importing its module.
"""
macro frank()
	quote
		# Import Franklin module; not possible to import it directly see 
		# https://discourse.julialang.org/t/why-wont-julia-let-me-put-a-module-import-within-a-function/46504/3
		# for why
		@frankimport()
		serve()
	end
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