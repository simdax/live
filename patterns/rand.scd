/* =====================================================================

FORME : nb d'entrees, enchainement
TEMPS : 
SET : entrees, poids

 =====================================================================
*/




(

Pdefn(\_rand2, PlazyEnvir{ arg enchainement=[0,1], temps=2, set=[0,1];
	var nb=enchainement.asSet.size;
	p{ arg inval;
		Pindex(
			Pstep(Pclump(nb, Pwhite(0,100)), temps).iter,
			enchainement.pseq
		).repeat.trace.iter.do{arg x;
			Pconst(2, Pseed(x, Prand(set, inf)))
			.embedInStream(inval)
		}
	}
});

Pdefn(\_pf,
	PlazyEnvir
	{arg pat=Pwhite(0,10), tps=4;
		p{
			arg ev;
			var	now=thisThread.beats; var t=tps.next;
			var s=pat.iter;
			//			ev.postln;
			while{(thisThread.beats<(now+t)).postln}
			{ev=s.next.postln.yield}
			{nil}
		}
	}
);

//Pbind(\bob, Pdefn(\pf)<>(tps:1)).trace.play;

Pdefn(\_rand,
	PlazyEnvir
	{
		arg forme=[100,1], temps=[2,3], set=[0,1], poids=1;
		var pattern, tpspat=temps.iter;
		if(poids.isNumber){poids=[poids]};
		if(poids.size < set.size){poids=set.size.collect(poids@@_)};
		pattern=if(set.isNumber, {
			Pwhite(0, set)
		}, {Pwrand(set,poids.normalizeSum, inf)});
		Pseed(
			forme.pseq(inf),
			Plazy
			{ Pdefn(\_pf) <> (pat:pattern, tps:tpspat.next) }
		)
	}
)

)


