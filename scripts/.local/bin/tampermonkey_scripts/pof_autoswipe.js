// ==UserScript==
// @name         Plenty of Fish AutoLike
// @description  Auto Like Bot for PoF
// @namespace    Plenty of Fish
// @match        https://www.pof.com/meetme/
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @version      1.0
// @grant        none
// ==/UserScript==

(function () {
  "use strict";

  function like(timer) {
    console.log("Like function called");
    let likeBtn = document.getElementById("meetmevotebutton-yes");
    if (likeBtn) {
      console.log("Liking now...");
      clearInterval(timer);
      likeBtn.click();
      setTimeout(like, 800);
    }
  }

  let likeTimer = setInterval(() => {
    like(likeTimer);
  }, 3000);
})();
