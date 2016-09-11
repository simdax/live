// =====================================================================
// SuperCollider Workspace
// =====================================================================


(
Pdefn(\forme, 4);
Pdefn(\densite, Pseed(Pdefn(\forme),Prand([1, 2, 3], 6)) );
Pdefn(\stretch, [2, 2, 4].reciprocal.iter.repeat);
(
deg:(set:[-1, 0, 1],forme:"abcabb",base:0),
dur:(set:[1,2,4], forme:"abaeee",base:10)
)
.keysValuesDo{ |k,v|
	Pdefn((k++\Seed).asSymbol, v.forme.convert.iter.repeat+v.base);
	Pdefn(k.asSymbol, PlazyEnvir{ arg densite;
		Prand(v[\set], densite)
});
};

Pdef(\mel,
	Pspawn(
		Pbind(
			\d, Pdefn(\densite), \s, Pdefn(\stretch),
			\seedR, Pdefn(\degSeed), \seedH, Pdefn(\durSeed),
			\delta, 0,
			\method, \seq,
			\pattern,
			Pfunc
			{arg in;
				Pbind(
					\densite, in.d,
					\degree, Pseed(Pn(in.seedR,1), Pdefn(\deg)),
					\dur, 1/Pseed(Pn(in.seedH,1), Pdefn(\dur)),
					\stretch, in.s
				)
			}
		).trace([\seedR, \seedH])
	)
)
)

(
Pdef(\mel).gui
)
