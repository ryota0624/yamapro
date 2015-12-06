'use strict';

window.onload = function () {
  var state = { title: 0, text: 0 };
  var titleChangeHandle = titleChange(state);
  var textChangeHandle = textChange(state);

  var btn = document.getElementById('post-btn');
  var btnStateChangeFunc = toggleBtnState(btn);
  btnStateChangeFunc();

  var title = document.getElementById('essay_title');
  title.onchange = function (ev) {
    titleChangeHandle(ev);
    if (essayState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };

  var text = document.getElementById('essay_text');
  text.onchange = function (ev) {
    textChangeHandle(ev);
    if (essayState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };
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

