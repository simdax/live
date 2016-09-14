(

var mvtPermis=[0,-2,-4, -3].iter.repeat; 

Pdef(\repe, p{ arg in;
	var ancien=0;
	loop{
		var deg=in.degree.value;
		if(deg==ancien){in.degree=ancien-2};
		ancien=deg;
		in=in.yield
	}
});


Pdef(\fromMel,
	Pdef(\repe)
	<>
	p{arg in;
		var last=0;
		loop{
			in=Pbind(
				\degree, Pfunc{
					arg in;
					var res=if(in.chrono%4==0){mvtPermis.next}
					{(in.degree==\rest).if{in.degree}{last}};
					last=if(in.degree.isInteger){in.degree}{last};
					//last.postln;
					res
				}%7,
				\degree, Pchords(Pkey(\degree)),
				\dur, Pfunc{arg in;
					if(in.chrono==12){4}{2}
				},
			).asStream.next(in).yield;
		}	
	} <> Pbind(\chrono, Ptime()%16)
).set(\dur, 2)
)



// (
// z=Pbind(\legato, 0.5, \degree, Pwhite(0,5), \dur, Prand([0.5, 1, 2], inf)).collect{arg x; a=x};
// Pdef(\io,Ptpar([
// 	0,z,
// 	0.001, Pbind(\legato, 1, \chan, 1)
// 	<>Pdef(\fromMel)
// 	<>z
// ]).midi(0)).trace.play
// )


