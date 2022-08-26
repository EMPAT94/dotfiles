// ==UserScript==
// @name         OKCupid AutoLike
// @description  Auto Liker for OKCupid
// @namespace    OKCupid
// @match        https://www.okcupid.com/discover
// @version      1.0
// @grant       none
// ==/UserScript==

function like(timer) {
  let likeBtn = document.getElementsByClassName("like");
  if (likeBtn && likeBtn[0]) {
    if (timer) clearInterval(timer);
    likeBtn[0].click();
    setTimeout(like, 1000);
  }
}

let startTimer = setInterval(() => {
  like(startTimer);
}, 3000);
