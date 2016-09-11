(

Pdefn(\root, 0);
5.do { |x|
	var r=10.rand;
    Pdef(x.asSymbol,
		Pseed(Pfunc{x+(~root?r)},
			Pbind(
				\degree, PlazyEnvir{
					arg setDeg=`[0,1], dir=`[1],
					degP=[1];
					degP=setDeg.size.collect({|x| degP.value@@x  }).normalizeSum;
					Pwrand(setDeg.value, degP.value, inf) * dir.value.iter.repeat
				},
				\dur, PlazyEnvir{
					arg setDur=`[1],
					durP=1!setDur.value.size;
					durP=setDur.size.collect({|x| durP.value@@x  }).normalizeSum;
					Pwrand(setDur.value, durP.value, inf).reciprocal
				},
			)
		)
	) 
};

Pdef(\mel,
		Pspawn(
			Pn(
				Pbind(
					\d,    Plazy{~duree.value.iter},
					\seed, Plazy{~forme.value.iter},
					\setDeg, `[1,2,3,4], \setDur, `[1,2,4,[8,8].pseq],
					\durP, Pindex(Pfunc{~dur.value}, Pseries()).collect(_.asRef),
					\degP, Pindex(Pfunc{~deg.value}, Pseries()).collect(_.asRef),
					\pattern, Pfunc{
						arg ev;
						Pfindur(ev.d, Pdef(ev.seed.asSymbol)<> ev)
					},
					\dur, 0,
					\method, \seq,
				)
			)
		)
);
)