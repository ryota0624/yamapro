"use strict";

window.onload = function () {
  var state = { name: 0, pass: "", passConf: "" };
  var nameHandle = nameChange(state);
  var passHandle = passChange(state);
  var passConfHandle = passConfChange(state);

  var btn = document.getElementById('submit-btn');
  var btnStateChangeFunc = toggleBtnState(btn);
  btnStateChangeFunc();

  var userName = document.getElementById('user_name');

  userName.onkeyup = function (ev) {
    nameHandle(ev);
    if (signFormState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };

  var pass = document.getElementById('user_password');

  pass.onkeyup = function (ev) {
    passHandle(ev);
    if (signFormState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };

  var passConf = document.getElementById('user_password_confirmation');
  passConf.onchange = function (ev) {
    passConfHandle(ev);
    if (signFormState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };
  passConf.onkeypress = function (ev) {
    passConfHandle(ev);
    if (signFormState(state)) {
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

function nameChange(state) {
  return function (ev) {
    return state.name = ev.target.value.length;
  };
}

function passChange(state) {
  return function (ev) {
    return state.pass = ev.target.value;
  };
}

function passConfChange(state) {
  return function (ev) {
    return state.passConf = ev.target.value;
  };
}

function signFormState(state) {
  var name = state.name;
  var pass = state.pass;
  var passConf = state.passConf;

  if (name > 0 && pass === passConf) {
    return alertForm(true);
  } else {
    if (pass === passConf) {
      return false;
    } else {
      return alertForm(false);
    }
  }
}

function alertForm(bool) {
  var alertTag = document.getElementById('alert');
  if (bool) {
    alertTag.setAttribute('hidden', 'hidden');
  } else {
    alertTag.removeAttribute('hidden');
  }
  return bool;
}

