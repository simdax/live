// =====================================================================
// SuperCollider Workspace
// =====================================================================



(


~zyn="ps -e | grep zynaddsubfx".unixCmdGetStdOut.notEmpty;
if (~zyn.not){
	r{
		"zynaddsubfx -I alsa --auto-connect -l /home/simdax/Musique/zyn.xmz".unixCmd;
		1.wait;
		MIDIClient.init;
		~connecterZyn.value;
	}.play
};

//helper
~connectZyn={
	try{MIDIOut.connect(~midiPort.value, MIDIClient.destinations
		.detect{|x| x.name=="ZynAddSubFX"}
	)}{"pas réussi à connecter !".warn}
};


)

