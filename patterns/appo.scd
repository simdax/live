// corrige la mélodie toujours au cas où il faudrait
// cela renvoie la note et l'accord
(
~nb=0;
Pdefn(\appo,p{arg ev;
	var nb=0; 
	loop{
		var a=ev.degree.value, b=ev.accords.value;
		var c=try{(a%7).wrap(-1,5)}{nil};
		// les accords varient entre -1 et 5
		if(c.isNil){		
			ev=[a, b].yield;
			// on touche à rien si c'est un \rest
		}
		{var res=if(b.includes(c).not, {
			var clos;
			clos=( b - c);
			nb=nb+1;
			if( // trois types de conditions :
				// 1. temps de dissonance possibles
				// 2. position métrique
				// 3. ou nb d'appogiatures possibles d'affilée
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
}
);
)