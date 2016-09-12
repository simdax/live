(
var a=
Psync(
	Pfindur(Pkey(\finales).asStream,
		Pbind(
			\metronome, Ptime(),
			\dur, Pseed(Pkey(\seed), Pwhite(1,Pkey(\set))).reciprocal.round(0.25),
			\dur, p{arg ev;
				var hit=0; 
				loop{
					if((ev.metronome%ev.regularite) > 0){hit=hit+1};
					//hit.postln;
					ev=ev.dur.yield
				}
			}
		)
	), Pkey(\periodes).asStream
);
var b=
Pbind(\seed, Pkey(\seed)+Pkey(\base))<>~master;

// Window.closeAll;
// "../patternBase.scd".loadRelative;
Pdef(\rythme,
	~pat.(a, b)
).envir_(
	(
		set:"4",
		finales:"3432", periodes:"4",
		seed:"aaba", base:0,
		//		stretch:1,
		//triple:false, quinte:false, sept:false,
		lag:0,
		regularite:0.5, accents:[[1,2,3]], contra:1, co:2,	
	)
);
)


