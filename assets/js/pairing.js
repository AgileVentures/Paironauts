if(JitsiMeetExternalAPI) {
  var domain = "meet.jit.si";
  var options = {
      roomName: "JitsiMeetAPIExample",
      width: 700,
      height: 700,
      parentNode: document.querySelector('#meet')
  }
  var api = new JitsiMeetExternalAPI(domain, options);
}