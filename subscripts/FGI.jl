# Functions related to fusion809.github.io
function fgiDir(path::String="")
	return gitDir("mine/websites/fusion809.github.io/$path")
end

macro frankImport()
 	quote
 		using Franklin
 	end
end

"""
	franklin()

Launches Franklin, after first importing its module. Cannot be defined as a function due to an issue mentioned at
https://discourse.julialang.org/t/why-wont-julia-let-me-put-a-module-import-within-a-function/46504/3
"""
macro franklin()
	quote
		# Import Franklin module
		@frankImport()
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

function cfgi(path::String="")
	webDir = fgiDir(path);
	code(webDir)
end

function gvfgi(path::String="")
	webDir = fgiDir(path);
	gvim(webDir)
end

function afgi(path::String="")
	webDir = fgiDir(path);
	atom(webDir)
end

macro fgiServ()
	quote
		cd(fgiDir())
		@franklin()
	end
end
