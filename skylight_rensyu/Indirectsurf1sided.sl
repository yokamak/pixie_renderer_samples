surface indirectsurf1sided(float samples = 64, maxdist = 1e30; string coordsystem = "")
{
	normal Nn = normalize(N);

	color indirect = indirectdiffuse(P, Nn, samples, "maxdist", maxdist,
			 "coordsystem", coordsystem);
	
	// Set Ci and Oi
	Ci = indirect * Cs * Os;
	Oi = Os;
}
