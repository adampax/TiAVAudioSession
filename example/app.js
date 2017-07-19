/**
 * You can test this by first playing some music on the device. I tested with the Music and Spotify apps
 * 
 * Step 0: Initialize the module at the beginning of your app.js or alloy.js with init()
 * 
 * Step 1: (btn1)
 * Right before you play your first sound, call enableDuckAudio(). This will add the 
 * AVAudioSessionCategoryOptionDuckOthers option so that the background music will dim/get softer 
 * while your app sound plays. 
 * 
 * Step 2: (btn2)
 * You only have to call enableDuckAudio() the first time a sound is played during an app session.
 * It will still apply to all other sounds while the app is open.  For example, btn2 just plays 
 * the sound without calling enableDuckAudio, but the audio will still dim.
 * 
 * If you send the app to background, start some music, then bring the app to foreground, you may
 * need to re-call enableDuckAudio.  It shouldn't hurt anything if you call enableDuckAudio()
 * every time you play a sound.
 * 
 * Step 3: (btn3)
 * I added disableDuckAudio() in case you want to disable it.  After disabling it, both background music
 * and your app sounds will play at the same level.
 * 
 * Note this is also the default setting after init() is
 * called but before enableDuckAudio().  You can test this by clicking btn3 and then clicking btn2, or
 * by removing the app from background and then launching and clicking btn2.
 */

var AVAudio = require('com.polancomedia.tiavaudiosession');
AVAudio.init();


var win = Ti.UI.createWindow({
	backgroundColor: '#fff'
});


var btn1 = Ti.UI.createButton({
	title: '1. Enable Duck Audio and Play',
	top: 100
});
win.add(btn1);

var crickets1 = Titanium.Media.createSound({
	url: 'cricket.wav'
});


btn1.addEventListener('click', function () {
	AVAudio.enableDuckAudio();
	crickets1.play();
});


var btn2 = Ti.UI.createButton({
	title: '2 Play Only',
	top: 200
});
win.add(btn2);

var crickets2 = Titanium.Media.createSound({
	url: 'cricket.wav'
});
btn2.addEventListener('click', function () {
	crickets2.play();
});


/**
 * I added this in case
 */
var btn3 = Ti.UI.createButton({
	title: '3 Disable Duck Audio',
	top: 300
});
win.add(btn3);

btn3.addEventListener('click', function () {
	AVAudio.disableDuckAudio();
});

win.open();