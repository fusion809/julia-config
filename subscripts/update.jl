function yay(args::String)
	run(`yay $args`)
end

function apmu()
	run(`apm update --confirm=false`)
end

function pkg()
	include(configDir("imports/pkg.jl"))
end

function update()
	yay("-Syu")
	apmu()
	pkg()
	Pkg.update()
end