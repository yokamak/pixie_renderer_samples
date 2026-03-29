surface indirectsurf2(float Kd =1, samples = 16; string envmap = "")
{
	//normal Ns = shadingnormal(N);
	normal Ns = faceforward (normalize(N),I);

	// Compute direct illumination
	color direct = diffuse (Ns);
	
	// Compute soft indirect illumination (if diff. depth < maxdiffusedepth)
	color indirect = indirectdiffuse(P, Ns, samples, "environmentmap", envmap);
	
	// Set Ci and Oi
	Ci = Kd * (direct + indirect) * Cs * Os;
	Oi = Os;
}
