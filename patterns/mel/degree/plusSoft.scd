(
var a= Pbind(
	\degree, p{ arg in;
		var pat;
		var next={pat=Pseed(~seed.postln, ~notes).asStream};
		next.value;
		loop{
			if(in.isRest){
				"rest détecté !".postln;
				in=\rest.yield;
				nil.yield
			}
			{
				in=pat.next.yield;
			}
		}
	},
).midi(0);
var c=(seed:"ab", notes:Pwhite(0,5));
var b=	Plazy{arg in;
	Pspawn(
		Pbind(\method,\seq,\delta,0,\pattern,
			Pfunc
			{ arg i;
				Penvir(i, a)
				// test with flags
				//				<>Pbind(\isRest, Pstep( [false,true].iter.repeat,[3,1].iter.repeat)).trace
			}
		) <> ~master <> in
	)
};
// Window.closeAll;
 Pdef(\degree, b).envir_(c);

)










