(

~pat={
	arg master, slave;
	Pspawner
	{		arg sp;
		var a=slave.asStream; var b;
		while{b=a.next(sp.event); b.notNil}{
			sp.seq(master <> b)
		}
	}
};
~master=Plazy{arg inEnvir;	
	var max;
	inEnvir.keysValuesChange{arg k,x;
		if(x.isString){x=x.collectAs(_.digit,Array)};
		x.asArray
	};
	max=inEnvir.collect(_.size).maxItem;
	inEnvir.keysValuesChange{arg k,v; v.iter.repeat};
	Pfin(max,Pbind(*inEnvir.asPairs)).trace
};
// specs

Spec.add(\base, [0, 10000, 0, 1]);
Spec.add(\stretch, [0.25, 4, 0, 0.25]);
Spec.add(\set, [1, 4, 0, 1]);
Spec.add(\contrametricite, [0, 1, \lin, 0.15]);
)



