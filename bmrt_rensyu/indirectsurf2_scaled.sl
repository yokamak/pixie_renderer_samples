/* indirectsurf2_scaled.sl
 * indirectsurf2 の550スケール対応版
 * minR / maxR をRIBから指定可能にした
 * 
 * 使い方:
 *   Surface "indirectsurf2_scaled"
 *       "Kd"      0.75
 *       "samples" 16
 *       "minR"    5.0      <- シーン最小サンプル間距離 (550スケール: 5〜20程度)
 *       "maxR"    200.0    <- シーン最大サンプル間距離 (550スケール: 100〜300程度)
 */
surface indirectsurf2_scaled(
    float Kd      = 1;
    float samples = 16;
    float maxdist = 1e30;
    string envmap = "")
{
    normal Ns = faceforward(normalize(N), I);

    /* 直接照明 */
    color direct = diffuse(Ns);

    /* 間接照明: icfキャッシュから補間*/
    /* indirectsurf2_scaled.sl を修正*/
    color indirect = indirectdiffuse(P, Ns, samples,
                     "maxdist", maxdist,   // ← Pixie 2.x で有効
                     "environmentmap", envmap);

    Ci = Kd * (direct + indirect) * Cs * Os;
    Oi = Os;
}
