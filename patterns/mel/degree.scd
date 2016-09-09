(
Spec.add(\setD, [-3, 3, 0, 1]);
Pdef(\phrase, Pbind()).set(\seed, 0, \setD, [-3, 3],\setR,[1,2,4]);
Pdef(\mel, Pchain(
	Psync(PlazyEnvir
		{ arg seed=0, setD=[0, 1], setR=[1, 2, 4];
			Pseed(seed,
				Pbind(
					\degree, Pwhite(*setD).round(1),
					\dur, Pwhite(*setR)
				)
			)
		}, 2, 4).repeat,
	Pdef(\phrase)
).trace
);


w=FlowView().front;
PdefGui(Pdef(\phrase), 3, w);
PdefGui(Pdef(\mel), 0, w);

)