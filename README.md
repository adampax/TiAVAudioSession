# TiAVAduioSession
## Enables the AVAudioSessionCategoryOptionDuckOthers option


This module is for using [AVAudioSessionCategoryOptionDuckOthers](https://developer.apple.com/documentation/avfoundation/avaudiosessioncategoryoptions/avaudiosessioncategoryoptionduckothers) which causes audio running from other apps (Music, Spotify, etc) to be temporarily ducked (reduced in volume) when this app plays a sound.

### Methods
* `init()`: Intializes the audio session for the app using `AVAudioSessionCategoryAmbient`.  This needs to be run when the app is first opened.
* `enableDuckAudio()`: Call this right before you play a sound. Note that you only need to call it once during an app session to have all sounds duck the audio, though calling it more than once, such as before every sound you play, is fine.
* `disableDuckAudio()` Optionally disable ducking. This returns the audio to Ambient Category, meaning the app sound and background audio will both be played at the same level.
### Example
```
//Do this once when app is first launched/resumed, such as in app.js or alloy.js:
//initialize the module
var AVAudio = require('com.polancomedia.tiavaudiosession');
AVAudio.init();

var btn1 = Ti.UI.createButton({
	title: '1. Enable Duck Audio and Play',
	top: 100
});
win.add(btn1);

var crickets1 = Titanium.Media.createSound({
	url: 'cricket.wav'
});

//background audio from Music, Spotify, etc, will be temporarily ducked or dimmed while
//crickets are chirping in your app.
btn1.addEventListener('click', function () {
	AVAudio.enableDuckAudio();
	crickets1.play();
});

win.open();

```



#### Build and run the example app

	ti build -p ios -d iphone

This will execute the app.js in the example folder as a Titanium application.

#### Building Only

	./iphone/build.py
