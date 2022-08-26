// ==UserScript==
// @name         Tinder Auto Swipe
// @description  Auto Swiper for Tinder
// @namespace    Tinder
// @match        https://tinder.com/app/recs
// @require      http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js
// @version      1.0
// @grant        none
// ==/UserScript==

setInterval(function a() {
  let i = 0;

  $(".button").each(function a() {
    if (i == 3) {
      $(this).click();
    }
    i++;
  });
}, 100);
