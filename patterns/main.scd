(
Pdef(\a,
Ptpar([
	0, Pbind(\chan,0)<>Pdef(\mel),
	0.01, Pbind(\chan,1, \dur, [2, 1, 1].iter.repeat)
	<>Pdef(\fromMel)
	<>Pdef(\mel).removing(\delta)
]).midi(0).repeat
);
Pdef(\a).play

)

