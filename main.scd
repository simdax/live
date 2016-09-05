// =====================================================================
// SuperCollider Workspace
// =====================================================================

(

Window.closeAll;
//Pdef.removeAll;

Zyn(1);
"init.scd".loadRelative;

//"patterns/rand.scd".loadRelative;
Pdef(\master, Pbind(
	\degree, Pkey(\degree)
	//.integrate,
	//\degree (Pdefn(\_pf) <> (tps:8,pat:Pkey(\degree).trace)),
	//	\octave, 5 -  (Pkey(\degree).div(7)),
	//	\mtranspose, Pstep(Pseq([0,2], inf), 2),
)
);

Pdef(\main, (
	Pdef(\repe)
	<>
	Pdef(\harmo)
	<>
	Pdef(\master)
	<>
	Pdef(\mel)
	<>
	Pbind(
		\beat, Ptime()//.wrap(0,2)
	)
)
);

Pdef(\dispatch,
	Pbind(\type, \midi, \midiout, Pfunc{MIDIOut(1)})
	<>
	Ppar([
		Pbind(
			\chan, 0,
			\degree, Pkey(\degree),
		) <> Pdef(\main).collect({|x| ~accords=x.accords; x }),
		Pbind(
			\chan, 1,
			\degree, Pfunc{~accords},
			\degree, PdegreeToKey(Pseq([0,1,2,3], inf), Pkey(\degree),7),
			\dur, Prorate(1/8!8, 2)
		)
	]),
);
PdefAllGui(bounds:Rect(0,0,150,150));

)