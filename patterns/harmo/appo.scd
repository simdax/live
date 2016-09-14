// corrige la mélodie toujours au cas où il faudrait
// cela renvoie la note et l'accord

(

Pdefn(\appo,p{arg ev;
	var nb=0;  // nb d'appos consécutives possibles
	loop{
		var note=ev.degree.value, accord=ev.accords.value?[0,2,4];
		var noteTmp=try{(note%7).wrap(-1,5)}{nil};
		// les accords varient entre -1 et 5
		if(noteTmp.isNil){
			"is NIl".postln;
			ev=[note, accord].yield;
			// on touche à rien si c'est un \rest
		}
		{var res=if(accord.includes(noteTmp).not,
			// si la note est une appo par rapport à l'accord
			{
				var clos;
				clos=( accord - noteTmp);
				nb=nb+1;
				// même si appo, ça peut passer à trois conditions
				if( // trois types de conditions :
					// 1. temps de dissonance possibles
					// 3. tant de dissonances d'affilée
					// 2. position métrique			
					(ev.dur>=1)
					or:
					([0,2].includes(try{ev.beat%4}{"pas de beat !".warn; 0})) // sur les accents
					or:
					(nb>1)
				)
				{
					//"repe = ".postln ; nb.postln;
					nb=0; 
					"on change de !".postln; 
					note+(clos.sort{|a, b| a.absdif(0) < b.absdif(0)}
						.at([0,1].wchoose([3,1]))
					).postln;
				}
				{note};
			},
			{nb=0; note}); // sinon on laisse couler, et on annule le compteur
			// et on yield 
			ev=[res, accord].flat.yield
		}
	}
}
);
Pdef(\appo, Pbind([\degree, \accord], Pdefn(\appo)));
)