(


var t, tt;
var init=MIDIClient;

var portDest=[nil, nil]!16;

var inOut=nil!16!2;
var first=true;
//~~midiPort=`0;
FlowView().front.flow{arg w;
	var lv, tv;
	var f=	{
		lv.items_(MIDIClient.destinations.collect{arg x, i;
			x.device.asString
		})
	};
	var curPort=EZNumber(w, 50@50, controlSpec:[1,16,0,1].asSpec);
	CheckBox(w, 100@100).string_("re-check?")
	.action_{arg s;
		if(first){MIDIClient.init; first=false}{MIDIClient.restart};
		s.value=false;
		f.value;
		init.changed(\init)};
	lv=ListView(w)
	.action_{ arg s;
		var in=curPort.value, out=s.value;
		MIDIOut.connect(in, out.postln);
		inOut[in][out]=true;
		//		curPort.changed(\value)
	};
	t=StaticText(w,50@50).string_(curPort);
	tt=StaticText(w,250@50).string_("MIDI initialized ? : "++init.initialized);

f.value
};


// SimpleController(curPort).put(\value, {arg s;
// 	t.string_("connecté")
// });
SimpleController(init).put(\init, {arg s;
	tt.string_("MIDI initialized ? : "++s.initialized)
});
)
