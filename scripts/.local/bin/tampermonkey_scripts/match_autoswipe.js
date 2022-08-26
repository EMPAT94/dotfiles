// ==UserScript==
// @name         Autoswipe Match.com
// @description  Auto swiper for match.com
// @namespace    Match
// @match        https://www.match.com/home
// @version      1.0
// @grant        none
// ==/UserScript==

(function () {
  "use strict";

  function like(timer) {
    let redLikeBtn = document.getElementsByClassName("css-m0z7d6");
    let blueLikeBtn = document.getElementsByClassName("css-1ky22fc");
    if ((redLikeBtn && redLikeBtn[0]) || (blueLikeBtn && blueLikeBtn[0])) {
      if (timer) clearInterval(timer);
      if (redLikeBtn) redLikeBtn[0].click();
      else blueLikeBtn[0].click();
      let skipTimer = setInterval(() => {
        skip(skipTimer);
      }, 500);
    }
  }

  function skip(timer) {
    let skipBtn = document.getElementsByClassName("css-1csl5tt");
    if (skipBtn && skipBtn[0]) {
      if (timer) clearInterval(timer);
      skipBtn[0].click();
      let likeTimer = setInterval(() => {
        like(likeTimer);
      }, 800);
    }
  }

  let startTimer = setInterval(() => {
    like(startTimer);
  }, 1000);
})();
