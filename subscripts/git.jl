function push(msg::String)
	run(`git add --all`);
	run(`git commit -m "$msg"`);
	branch = chomp(read(`git rev-parse --abbrev-ref HEAD`, String));
	run(`git push origin $branch`)
end

function gitlog()
	run(`git log`)
end

# git functions
function gitc(repo)
	run(`git clone $repo`)
end