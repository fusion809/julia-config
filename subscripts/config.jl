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

function crc()
	code(pathrc())
	src()
end

function ccf()
	code(configDir())
end