TempoClock.tempo=2

(
Pdef(\repe, p{ arg in;
	var ancien=0;
	loop{
		var deg=in.degree.value;
		if(deg==ancien){in.degree=ancien-2};
		ancien=deg;
		in=in.yield
	}
})
)

(
var mvtPermis=[0,-2,-4, -3].iter.repeat; 
Pdef(\fromMel,
	Pdef(\repe)
	<>
	Plazy{
	Pbind(
		\degree, Pfunc{
			arg in; if(in.chrono%4==0){mvtPermis.next}{in.degree};
		}%7,
		\dur, Pfunc{arg in;
			if(in.chrono==12){4}{2}
		}
)
} <> Pbind(\chrono, Ptime()%16)
).set(\dur, 2)
)
Pdef(\fromMel).gui

(
z=Pbind(\legato, 0.5, \degree, Pwhite(0,5), \dur, Prand([0.5, 1, 2], inf)).collect{arg x; a=x};
Pdef(\io,Ptpar([
	0,z,
	0.001, Pbind(
		\legato, 1, \chan, 1,  \degree, Pkey(\degree)+[0,2,4])
	<>
	p{arg in; 
		(Pdef(\fromMel)<>(degree:in.degree.asStream)).embedInStream
	}
	<>Pbind(\degree, `Pfunc{a.degree})
]).midi(0)).play
)

