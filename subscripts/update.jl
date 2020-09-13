function yay(args::String)
	run(`yay $args`)
end

function apmu()
	run(`apm update --confirm=false`)
end

macro pkg()
    quote
        using Pkg
    end
end

macro update()
	quote
		yay("-Syu --noconfirm")
		apmu()
		@pkg()
		Pkg.update()
	end
end