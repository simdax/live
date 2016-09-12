// =====================================================================
// SuperCollider Workspace
// =====================================================================

(

~midiPort=0;
Window.closeAll;
Pdef.removeAll;

"init.scd".loadRelative;

//"patterns/rand.scd".loadRelative;


Pdef(\main, (
	// Pdef(\repe)
	// <>
	Pdef(\harmo)
	<>
	// TODO take of contrametricity, periodic rhythm
	// and intervals
	Pdef(\master, Pbind(
		// \degree, Pkey(\degree),
		// \dur, p{ arg in;
		// 	var accents=Pstep(Pseq([4, 2], inf), 4).asStream;
		// 	loop{
		// 		var temps=in.beat % 4;
		// 		if(temps>=accents.value){
		// 			in.amp=0;
		// 			in=(4-temps).yield
		// 		}
		// 		{in=in.dur.yield}
		// 	}
		// }
		//		\dur, Psync(Pkey(\dur), 4, 4),
		//.integrate,
		//\degree (Pdefn(\_pf) <> (tps:8,pat:Pkey(\degree).trace)),
		//	\octave, 5 -  (Pkey(\degree).div(7)),
		//	\mtranspose, Pstep(Pseq([0,2], inf), 2),
	))	
	<>
	Pdef(\mel)
	<>
	Pbind(
		\beat, Ptime()//.wrap(0,2)
	)
)
);

Pdef(\dispatch,
	Pbind(\type, \midi, \midiout, Pfunc{MIDIOut(~midiPort)})
	<>
	Ppar([
		Pbind(
			\chan, 0,
			\degree, Pkey(\degree),
		) <> Pdef(\main).collect({|x| ~accords=x.accords; x }),
		Pbind(
			\chan, 1,
			\degree, Pfunc{~accords},
			\degree, PdegreeToKey(
				Pseq([0,1,2,3], inf), // accord de base
				Pkey(\degree),7),
			\dur, Prorate(1/8!8, 2)
		)
	]),
);

//"setup.scd".loadRelative;
Zyn(~midiPort);
PdefAllGui();
"GUI/mel.scd".loadRelative
)


