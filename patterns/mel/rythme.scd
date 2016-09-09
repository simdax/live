(
Pdef(\rythme,
	PlazyEnvir
	{ arg periode=4, set=2, seed="ab".convert.iter.repeat, base=0;
		[periode, set, seed, base].postln;
		Pspawn(
			Pbind(
				\method, \seq, \delta, 0,
				\pattern, Pfunc{arg in;
					Pbind(\dur,
						PlazyEnvir
						{ arg set, forme, periode, seed;
							var a=[]; set=(1..set).reciprocal;
							thisThread.randSeed_(seed);
							while({a.sum<periode}, {
								a=a.add(set.choose)
							});	a.postln.iter
						} <> in
					)}
			)
			<>
		Pbind(
			\periode, Pkey(\periode),
			//			\set, Pkey(\set),
			\seed, Pkey(\seed),
			\base, Pkey(\base),
		)
		)
	}
)
)

Pdef(\rythme).gui
