(

Pdef(\repe, Pbind(
	\degree, p{ arg ev;
		// nb de répétitions possibles
		var nb=0; var noteP;
		loop{
			var res, note=ev.degree.value;
			note!? {
				if(note==noteP){nb=nb+1}{nb=0}
			};
			res=if(nb>0){
				(note+([-2,2].choose))
				.nearestInScale(ev.accords,7)
			}{note};
			noteP=res;
			ev=res.yield
		}
	}
));

)