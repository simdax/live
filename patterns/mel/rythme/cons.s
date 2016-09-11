(
var a=
Pbind(\dur,	
	p{arg i;
		var finale=i.finales?4;
		var set=i[\set]?2, periode=i.periodes?4, seed=i.seed?0, base=i.base?0;
		var a=[], bob, size;
		set=(1..set)
		.removeAll(
			if((i.triple?false).not){[3]}{[]}
			++if((i.quinte?false).not){[5]}{[]}
			++if((i.sept?false).not){[7]}{[]}
		).postln.reciprocal;
		thisThread.randSeed_(base+seed);
		while({a.sum<finale}, {
			a=a.add(set.choose)
		});
		a[a.size-1]=a[a.size-1]-(a.sum-finale);
		if((periode-finale).postln!=0){a=a.add(periode-finale)};
		size=a.size;
		a=a.postln.iter;
		while{bob=a.next; bob.notNil}
		{i.nb_(size);
			i=bob.yield}
	}
);
var b=	Plazy{arg inEnvir;	
	var max;
	inEnvir.keysValuesChange{arg k,x;
		if(x.isString){x=x.collectAs(_.digit,Array)};
		x.asArray
	};
	max=inEnvir.collect(_.size).maxItem;
	inEnvir.keysValuesChange{arg k,v; v.iter.repeat};
	Pfin(max,Pbind(*inEnvir.asPairs)).trace
}; 

Window.closeAll;
"../patternBase.scd".loadRelative;
Pdef(\rythme,
	~pat.(a, b)
).envir_(
	(
		set:"2",
		finales:"43", periodes:4,
		seed:"ab", base:0,
		stretch:0.5,
		//triple:false, quinte:false, sept:false,
		lag:0,
		regularite:0.25, contra:1, co:2,	
	)
).gui;
)


