surface indirectsurf(float samples = 16, minsamples = 16, maxdist = 1e30;
			 string coordsystem = "", envmap = "")
{
	// normal Ns = shadingnormal(N);
	normal Ns = faceforward (normalize(N),I);

	Ci = diffuse(Ns) + 
	indirectdiffuse(P, Ns, samples, "maxdist", maxdist, "coordsystem", coordsystem,
			"environmentmap", envmap);

	Ci *= Cs * Os;
	Oi = Os;
}
