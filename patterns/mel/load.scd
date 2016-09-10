(
"patternBase.scd,rythme.scd".split($,).do{arg x;
x.loadRelative};

Window.closeAll; s.boot;
d.gui(3);
Pdef(\0).gui

)