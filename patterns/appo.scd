(
~nb=0;
Pdefn(\appo,p{arg ev;
	var nb=0;
	loop{
		var a=ev.degree.value, b=ev.accords.value;
		var c=(a%7).wrap(-1,5);
		var res=if(b.includes(c).not, {
			var clos=( b - c);
			nb=nb+1;
			if( 
				(ev.dur>=1)
				or:
				([0,2].includes(ev.beat%4))
				or:
				(nb>1)
			)
			{
				//				"on change !".postln; nb.postln;
				a+(clos.sort{|a, b| a.absdif(0) < b.absdif(0)}
					.at([0,1].wchoose([3,1]))
				);
				nb=0; 
			}
			{a};
		}, {nb=0; a});
		ev=[res, b].flat.yield
	}
}
);
)