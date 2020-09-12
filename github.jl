# GitHub repos base dir
"""
	gitDir(path::String="")
"""
function gitDir(path::String="")
	if isdir("/data/GitHub")
		return "/data/GitHub/$path"
	elseif isdir("/data/fusion809/GitHub")
		return "/data/fusion809/GitHub/$path"
	end
end