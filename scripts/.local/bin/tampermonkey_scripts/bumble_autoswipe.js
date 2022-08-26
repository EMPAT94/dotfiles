// ==UserScript==
// @name         Bumble Auto Swipe
// @description  Auto Swiper for Bumble
// @namespace    Bumble
// @match        https://bumble.com/app
// @icon         https://www.google.com/s2/favicons?domain=bumble.com
// @version      1.0
// @grant        none
// ==/UserScript==

(function () {
  function eventFire(target, etype) {
    if (target.fireEvent) {
      target.fireEvent(`on${etype}`);
    } else {
      const evObj = document.createEvent("Events");
      evObj.initEvent(etype, true, false);
      target.dispatchEvent(evObj);
    }
  }

  function like(timer) {
    const likeBtn = document.getElementsByClassName("encounters-action--like");
    if (!likeBtn || !likeBtn[0]) return;
    if (timer) clearInterval(timer);
    setTimeout(() => {
      eventFire(likeBtn, "click");
      like();
    }, 8000);
  }

  let likeTimer = setInterval(() => {
    like(likeTimer);
  }, 3000);
})();
