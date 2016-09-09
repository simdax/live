(
Pdef(\rythme,
	PlazyEnvir
	{arg periode, set, seed, base;
		[periode, set, base, seed].postln;
		Pspawn(
			Pbind(
				\method, \seq, \delta, 0,
				\pattern, Pfunc{arg in;
					Pbind(\dur,
						PlazyEnvir
						{ arg set, forme, periode, seed;
							var a=[]; set=(1..set.postln).reciprocal;
							thisThread.randSeed_(seed);
							while({a.sum<periode}, {
								a=a.add(set.choose)
							});	a.postln.iter
						} <> in
					)}
			)
			<>
			Pbind(
				\periode, periode.iter.repeat(seed.size),
				\set, set.collectAs(_.digit,Array).iter.repeat(seed.size),
				\seed, seed.convert.iter,
				\base, base.iter.repeat(seed.size)
			).trace
	)}.repeat
)
)

Pdef(\rythme)
.envir_(
	(periode:4, set:"2",
		seed:"ab", base:0,
	stretch:1)
).gui
