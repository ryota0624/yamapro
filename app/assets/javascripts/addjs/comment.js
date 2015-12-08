'use strict';

window.onload = function () {
  var state = { comment: 0 };
  var commentChangeHandle = commentChange(state);

  var btn = document.getElementById('submit-btn');
  var btnStateChangeFunc = toggleBtnState(btn);
  btnStateChangeFunc();

  var comment = document.getElementById('inkome');
  comment.onkeyup = function (ev) {
    commentChangeHandle(ev);
    if (commentState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };
};

function toggleBtnState(btn) {
  return function (bool) {
    if (bool) {
      btn.removeAttribute('disabled');
    } else {
      btn.setAttribute('disabled', 'disabled');
    }
    return btn;
  };
}

function commentChange(state) {
  return function (ev) {
    return state.comment = ev.target.value.length;
  };
}

function commentState(state) {
  var comment = state.comment;

  if (comment > 0) {
    return true;
  } else {
    return false;
  }
}

