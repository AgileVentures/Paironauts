// we're hard-coding roomName and parentNode here
// maybe overkill, but I want to think about how we might inject these instead
// as long as we were to do it without obfuscating stuff or making it super unwieldy

if(typeof JitsiMeetExternalAPI != "undefined") {
  var domain = "www.jitsi.agileventures.org";
  var options = {
      roomName: window.location.pathname.substr(1),
      width: 700,
      height: 700,
      parentNode: document.querySelector('#meet')
  }
  var api = new JitsiMeetExternalAPI(domain, options);
}
