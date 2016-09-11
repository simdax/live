(
Spec.add(\setD, [-3, 3, 0, 1]);
Pdef(\phrase, Pbind()).set(\seed, 0, \setD, [-3, 3],\setR,[1,2,4]);
Pdef(\mel, 
	Psync(PlazyEnvir
		{ arg seed=0, setD=[0, 1], setR=[1, 2, 4];
			Pseed(seed,
				Pbind(
					\degree, Pwhite(*setD).round(1),
					\dur, Prand(setR, inf)
				)
			)
		}, 2, Pseq([2, 3, 4], inf).asStream).repeat
	<> Pdef(\phrase)
).trace
);

(
w=FlowView().front;
PdefGui(Pdef(\phrase), 3, w).playBut.remove;
PdefGui(Pdef(\mel), 0, w);
w.keyDownAction_{arg s, k;
switch(k, $p , {Pdef(\mel).toggle})}
)