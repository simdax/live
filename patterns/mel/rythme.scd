(
Pdef(\rythme,
	Pspawn(
		Pbind(
			\method, \seq, \delta, Pn(0,1),
			\pattern, Pfunc{ arg in;
				Pbind(\dur,	
					p{arg i;
						var set=i[\set]?2, periode=i.periode?4, seed=i.seed?0, base=i.base?0;
						var a=[], bob, size;
						set=(1..set).reciprocal;
						thisThread.randSeed_(base+seed);
						while({a.sum<periode}, {
							a=a.add(set.choose)
						});
						size=a.size;
						a=a.postln.iter;
						while{bob=a.next; bob.notNil}
						{i.nb_(size);
						i=bob.yield}
					},
				)
			}		 
		)
	)
);
Pdef(\rythmeFeed,
	Pbind(\seed,
		Plazy
		{arg in; (in.seed? "ab").convert.iter}
	)
).envir_(
	( set:2,
		seed:"ab", base:0,
		stretch:1)
);
)

// (
// s.boot;
// Window.closeAll;
// Spec.add(\base, [0, 1, 0, 1]);
// Spec.add(\periode, [0.5, 8, 0, 0.5]);
// Pdef(\rythme).envir_(()).gui;
// Pdef(\rythmeFeed).gui
// )