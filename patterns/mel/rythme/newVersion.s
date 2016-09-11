
(
(Pbind(\degree, Array.rand(6,0,5))
<>
Pbind(
	\legato, Pfunc{arg in;
		(in.lag.postln.differentiate.drop(1)++1).normalizeSum
	})
<>
Pbind(
	\dur, Pn(4,1),
	\lag, Pfunc{arg in;
		thisThread.randSeed_(in.seed?0);
		(in.preums?0).asArray++(
			((in.nb?6)-1).collect{(1..(in.reso?3)).choose}.postln
			.normalizeSum*(in.finale?3))
		.integrate
	},
)).repeat.trace.play
)



