(
var a=r{ arg in;
	var init=[];
	loop{
		var n=in.asArray;
		var res=(n.asSet -- init);
		init=n;
		in=(res.asArray).yield
	}
};

var pforme={arg pattern;
	var p=pattern.asStream, pval;
	r{
		while{pval=p.next.postln; pval.notNil}
		{pattern=a.next(pval).yield};
	}
};

Pdef(\_forme,
	Pfset({a.reset},
		Pbind(
			\do, Pfunc{ arg ev;
				ev.formeP.do { |x|
					if(Pdef(x).isPlaying, {
						Pdef(x).stop
					}, {Pdef(x).play}
					)};
			}
		)
		<>
		Pbind(
			\formeP, 
			p{ arg ev;
				loop{
					b=if(ev.forme.class!=False){ev.forme.pseq}
					{Pclump(Prand((1..3), inf), Pxrand((..5), inf))};
					ev=pforme.(b).embedInStream(ev);
				}
			},
		) 
	)
)
.quant_([4, 0, 0.1])
.envir_((forme:[1,2,3,4], dur:4));


)


