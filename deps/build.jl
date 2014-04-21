using BinDeps

@BinDeps.setup

deps = [ glut = library_dependency("GLUT", aliases = ["libglut", "freeglut"]) ]

@windows_only begin
	using WinRPM
	provides(WinRPM.RPM, "freeglut", glut, os = :Windows)
end

provides(AptGet,
		{"freeglut3-dev" => glut})

provides(Yum,
		{"freeglut-devel" => glut})

@BinDeps.install