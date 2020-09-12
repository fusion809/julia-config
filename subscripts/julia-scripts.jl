
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