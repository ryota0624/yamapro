'use strict';

var state = { title: 0, text: 0 };
var titleChangeHandle = titleChange(state);
var textChangeHandle = textChange(state);
var mdText = document.getElementById("mdText");
var btn = document.getElementById('post-btn');
var btnStateChangeFunc = toggleBtnState(btn);
btnStateChangeFunc();

$( document ).ready(function(){
  $(".button-collapse").sideNav();
})

var title = document.getElementById('essay-title');
title.onkeyup = function (ev) {
  titleChangeHandle(ev);
  if (essayState(state)) {
    btnStateChangeFunc(true);
  } else {
    btnStateChangeFunc(false);
  }
};


var text = document.getElementById('essay-text');
text.onkeyup = function (ev) {
	mdText.innerHTML = marked(ev.target.value, {sanitize: true})
  textChangeHandle(ev);
  if (essayState(state)) {
    btnStateChangeFunc(true);
  } else {
    btnStateChangeFunc(false);
  }
};

function toggleBtnState(btn) {
  return function (bool) {
    console.log('fuck');
    if (bool) {
      btn.removeAttribute('disabled');
    } else {
      btn.setAttribute('disabled', 'disabled');
    }
    return btn;
  };
}

function titleChange(state) {
  return function (ev) {
		console.log(ev.target.value)
    return state.title = ev.target.value.length;
  };
}

function textChange(state) {
  return function (ev) {
    return state.text = ev.target.value.length;
  };
}

function essayState(state) {
  var title = state.title;
  var text = state.text;

  if (title > 0 && text > 0) {
    return true;
  } else {
    return false;
  }
}
