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
		# Writing the following line in terms of the yay function fails
		run(`yay -Syu --noconfirm`)
		if isfile("/usr/bin/apm")
			apmu()
		end
		@pkg()
		Pkg.update()
	end
end
