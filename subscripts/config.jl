function cdcf(path::String="")
	cfDir = configDir(path);
	cd(cfDir);
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

function grc()
	gvim(pathrc())
	src()
end

function arc()
	atom(pathrc())
end

function crc()
	code(pathrc())
	src()
end

function vcf(path::String="")
	vim(configDir(path))
	src()
end

function acf(path::String="")
	atom(configDir(path))
	src()
end

function gcf(path::String="")
	gvim(configDir(path))
	src()
end

function ccf(path::String="")
	code(configDir(path))
	src()
end
