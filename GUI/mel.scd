(

var w;
var b;

//Window.closeAll;


~createTab={
	arg name;
	var first=true;
	var mouseAction=
	{arg s, x, y, mod, xdelta, ydelta;
		
			ydelta.sign.switch(
				-1, {tab.label=(tab.label.asInt-1).asString;
					~tv.refresh},
				1, {tab.label=(tab.label.asInt+1).asString;
					~tv.refresh}
			)
		;
		~forme.changed(\s)
	};

	var tab=~tv.add(name.asString)
	.rightClickDetach_(false);
	
	tab.widget.addAction(mouseAction, \mouseWheelAction);
	tab.view.layout_(
		HLayout(*2.collect{arg j;
			View().background_(Color.rand)
			.layout_(
				HLayout(
					*4.collect{|i|
						var index=~deg.value.size-1;
						Slider()
						.action_{ arg s;
							switch(j, 
								0, {~deg.value[index][i]=s.value},
								1, {~dur.value[index][i]=s.value}
							);
						}
						.valueAction_(0.5)
					}
				)
			)
		}
		)
	);

};
~duree=`[]; ~forme=`[];
SimpleController(~forme).put(\s, {arg s;
	s.value=~tv.tabViews.collect(_.label)
});
SimpleController(~duree).put(\add,{arg s;
	~deg.value=~deg.value.add(0.5!4); ~dur.value=~dur.value.add(0.5!4);
	~createTab.(~tv.tabViews.size);
	~forme.changed(\s);
})
.put(\remove,{arg s;
	~deg.value.drop(-1); ~dur.value.drop(-1);
	~tv.removeAt(~tv.tabViews.size-1);
	~forme.changed(\s);
});

~deg=`[]; ~dur=`[];

z=Window("mel", 600@300).front;
z.addFlowLayout;

FlowView(z, 300@300).flow{ arg w;
	~tv=TabbedView2(w)
	.lockEdges_(true); 
	~tv.labelColors_([Color.red,Color.blue]);
	~duree.value.size.collect { |x|
		~createTab.(x)
	};
	w.decorator.nextLine;
};

FlowView(z, 250@300).flow{arg w;
	var spec=[0.5,4,1,0.5].asSpec;
	var msv=MultiSliderView(w, 200@200)
	.elasticMode_(true)
	.value_(~duree.value)
	.action_{ arg s;
			~duree.value=spec.map(s.value)
	};
	Button(w).action_{
		msv.valueAction_(msv.value++[0.5]);
		~duree.changed(\add)
	}
	.doAction
	;
	Button(w).action_{
		msv.valueAction_(
			if(msv.value.size>1)
			{~duree.changed(\remove); msv.value.drop(-1)}
			{msv.value});
	}
};




)


