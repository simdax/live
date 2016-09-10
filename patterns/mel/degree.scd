(
Pdef(\rythmeFeed).copy(\0);
d=(seed:"ab", base:0, set:[0,1,2,3,4]);
(
Pbind(
	\degree,
	p {arg in;
		var seeds=d.seed.convert.iter.trace+d.base;
		var seed;
		while{seed=seeds.next; seed.notNil}{
			var nb=in.nb;
			in=Pseed(
				Pn(seed,1),
				Prand(d[\set], nb.postln)
			).embedInStream(in)
		}
	}
).repeat
<>
~pat.(\rythme, Pdef(\0).repeat)
).play
)

