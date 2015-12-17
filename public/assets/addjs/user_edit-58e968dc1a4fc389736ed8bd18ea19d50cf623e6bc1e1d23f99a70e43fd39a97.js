'use strict';

window.onload = function () {
  var state = { pass: "", passConf: "" };
  var passHandle = passChange(state);
  var passConfHandle = passConfChange(state);
  var btn = document.getElementById('submit-btn');
  var btnStateChangeFunc = toggleBtnState(btn);

  var pass = document.getElementById('user_password');
  pass.onchange = function (ev) {
    passHandle(ev);
    if (signFormState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };
  pass.onkeypress = function (ev) {
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
  var pass = state.pass;
  var passConf = state.passConf;

  console.log(pass, passConf);
  if (pass === passConf && pass.length === 0) {
    return alertForm(true);
  }
  if (pass === passConf) {
    return alertForm(true);
  } else {
    return alertForm(false);
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

