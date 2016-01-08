"use strict";

var huko = document.createElement("h1");
huko.innerHTML = "click me";
var header = document.getElementById("header");
var title = document.getElementById("title");
var copy = document.getElementById("copy");
var path = document.location.pathname;
huko.onclick = function () {
  document.location.replace("https://sutpro.herokuapp.com");
};
console.log(path);

var oyaHuko = function oyaHuko(header, text, location) {
  return function () {
    if (location == "/about") {
      header.removeChild(header.children[0]);
      header.appendChild(text);
    }
  };
};

var headerChange = oyaHuko(header, huko, path);
title.onmouseover = function () {
  copy.onclick = headerChange;
};

